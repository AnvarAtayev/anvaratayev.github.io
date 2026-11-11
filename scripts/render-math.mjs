#!/usr/bin/env node
/**
 * Build-time math rendering: walk Hugo's public/ HTML, replace TeX delimiters
 * with KaTeX HTML, copy KaTeX CSS/fonts into public/, strip any MathJax tags.
 */
import fs from 'node:fs';
import path from 'node:path';
import { fileURLToPath } from 'node:url';
import katex from 'katex';

const __dirname = path.dirname(fileURLToPath(import.meta.url));
const root = path.resolve(__dirname, '..');
const publicDir = path.join(root, 'public');
const katexDist = path.join(root, 'node_modules', 'katex', 'dist');

const KATEX_OPTS_BASE = {
  throwOnError: false,
  strict: 'ignore',
  trust: true,
  macros: {
    '\\RR': '\\mathbb{R}',
    '\\CC': '\\mathbb{C}',
    '\\NN': '\\mathbb{N}',
    '\\QQ': '\\mathbb{Q}',
    '\\PP': '\\mathbb{P}',
    '\\EE': '\\mathbb{E}',
    '\\ZZ': '\\mathbb{Z}',
  },
};

function walkHtmlFiles(dir, out = []) {
  for (const ent of fs.readdirSync(dir, { withFileTypes: true })) {
    const p = path.join(dir, ent.name);
    if (ent.isDirectory()) walkHtmlFiles(p, out);
    else if (ent.isFile() && ent.name.endsWith('.html')) out.push(p);
  }
  return out;
}

function copyKatexAssets() {
  const dest = path.join(publicDir, 'katex');
  fs.mkdirSync(path.join(dest, 'fonts'), { recursive: true });
  fs.copyFileSync(path.join(katexDist, 'katex.min.css'), path.join(dest, 'katex.min.css'));
  const fontsDir = path.join(katexDist, 'fonts');
  for (const f of fs.readdirSync(fontsDir)) {
    if (f.endsWith('.woff2') || f.endsWith('.woff')) {
      fs.copyFileSync(path.join(fontsDir, f), path.join(dest, 'fonts', f));
    }
  }
}

/** Protect regions that must not be scanned for math. */
function protect(html) {
  const slots = [];
  const pushed = (m) => {
    const i = slots.length;
    slots.push(m);
    return `\uE000${i}\uE001`;
  };
  let out = html;
  out = out.replace(/<!--[\s\S]*?-->/g, pushed);
  out = out.replace(/<script\b[^>]*>[\s\S]*?<\/script>/gi, pushed);
  out = out.replace(/<style\b[^>]*>[\s\S]*?<\/style>/gi, pushed);
  out = out.replace(/<pre\b[^>]*>[\s\S]*?<\/pre>/gi, pushed);
  out = out.replace(/<code\b[^>]*>[\s\S]*?<\/code>/gi, pushed);
  out = out.replace(/<textarea\b[^>]*>[\s\S]*?<\/textarea>/gi, pushed);
  return { html: out, slots };
}

function restore(html, slots) {
  return html.replace(/\uE000(\d+)\uE001/g, (_, i) => slots[Number(i)]);
}

function decodeEntities(tex) {
  return tex
    .replace(/&amp;/g, '&')
    .replace(/&lt;/g, '<')
    .replace(/&gt;/g, '>')
    .replace(/&quot;/g, '"')
    .replace(/&nbsp;/g, ' ')
    .replace(/&#x([0-9a-fA-F]+);/g, (_, h) => String.fromCodePoint(parseInt(h, 16)))
    .replace(/&#(\d+);/g, (_, d) => String.fromCodePoint(Number(d)));
}

function normalizeTex(tex) {
  let t = decodeEntities(tex);
  // KaTeX has no eqnarray. Use `aligned` (not `align`): KaTeX `align`
  // stretches to the full content width and leaves huge gaps around `=`.
  // Also rewrite eqnarray's 3-column `& = &` to `&=`.
  const wasEqnarray = /\\begin\{eqnarray\*?\}/.test(t);
  t = t.replace(/\\begin\{eqnarray\*?\}/g, '\\begin{aligned}');
  t = t.replace(/\\end\{eqnarray\*?\}/g, '\\end{aligned}');
  // Same stretch issue if content already used align/align*
  t = t.replace(/\\begin\{align\*\}/g, '\\begin{aligned}');
  t = t.replace(/\\end\{align\*\}/g, '\\end{aligned}');
  t = t.replace(/\\begin\{align\}/g, '\\begin{aligned}');
  t = t.replace(/\\end\{align\}/g, '\\end{aligned}');
  if (wasEqnarray) {
    t = t.replace(/&\s*=\s*&/g, '&=');
    t = t.replace(/\\nonumber\b/g, '');
    // Source often writes `\nonumber\\\` — after stripping nonumber, collapse
    // leftover `\\\` before a newline into a single LaTeX row break.
    t = t.replace(/\\\\\\[ \t]*\n/g, '\\\\\n');
  }
  return t;
}

function renderTex(tex, displayMode, stats) {
  stats.attempted++;
  const normalized = normalizeTex(tex);
  try {
    const html = katex.renderToString(normalized, { ...KATEX_OPTS_BASE, displayMode });
    // throwOnError:false still emits .katex-error nodes for some failures
    if (html.includes('katex-error')) {
      stats.failed++;
      const m = html.match(/title="([^"]*)"/);
      stats.errors.push({ tex: normalized.slice(0, 120), message: m ? m[1] : 'katex-error' });
    } else {
      stats.ok++;
    }
    return html;
  } catch (err) {
    stats.failed++;
    stats.errors.push({ tex: normalized.slice(0, 120), message: err.message });
    const esc = normalized.replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g, '&gt;');
    return displayMode
      ? `<pre class="math-render-error" title="${err.message.replace(/"/g, '&quot;')}">${esc}</pre>`
      : `<code class="math-render-error" title="${err.message.replace(/"/g, '&quot;')}">${esc}</code>`;
  }
}

function renderMathInFragment(fragment, stats) {
  // Slot-protect each rendered node immediately so later passes cannot
  // re-match TeX inside KaTeX MathML annotations (e.g. \begin{aligned}).
  const slots = [];
  const park = (html) => {
    const i = slots.length;
    slots.push(html);
    return `\uE002${i}\uE003`;
  };
  const render = (tex, displayMode) => park(renderTex(tex, displayMode, stats));

  let s = fragment;

  // Display: $$...$$
  s = s.replace(/\$\$([\s\S]+?)\$\$/g, (_, tex) => render(tex, true));

  // Display: \[...\]
  s = s.replace(/\\\[([\s\S]+?)\\\]/g, (_, tex) => render(tex, true));

  // Display environments: \begin{env}...\end{env}
  s = s.replace(
    /\\begin\{([a-zA-Z*]+)\}([\s\S]*?)\\end\{\1\}/g,
    (_full, env, body) => render(`\\begin{${env}}${body}\\end{${env}}`, true)
  );

  // Inline: \(...\)
  s = s.replace(/\\\(([\s\S]+?)\\\)/g, (_, tex) => render(tex, false));

  // Inline: $...$ — allow newlines and TeX inequalities like `a < b`, but stop
  // before real HTML tags (`<em>`, `</p>`, …).
  s = s.replace(
    /(?<!\$)\$(?!\$)((?:\\\$|[^$<]|<(?![a-zA-Z/!]))+?)(?<!\\)\$(?!\$)/g,
    (_, tex) => render(tex, false)
  );

  return s.replace(/\uE002(\d+)\uE003/g, (_, i) => slots[Number(i)]);
}

function stripMathJax(html) {
  // Remove MathJax config + script tags inserted by layouts/partials/math.html
  let out = html;
  out = out.replace(/<script>\s*MathJax\s*=[\s\S]*?<\/script>\s*/i, '');
  out = out.replace(/<script[^>]*mathjax[^>]*>[\s\S]*?<\/script>\s*/gi, '');
  out = out.replace(/<script[^>]*cdn\.jsdelivr\.net\/npm\/mathjax[^>]*><\/script>\s*/gi, '');
  return out;
}

function ensureKatexCss(html) {
  if (/katex\/katex\.min\.css/.test(html)) return html;
  const link = '<link rel="stylesheet" href="/katex/katex.min.css">\n';
  if (/<\/head>/i.test(html)) return html.replace(/<\/head>/i, `${link}</head>`);
  return link + html;
}

function processFile(file, stats) {
  const raw = fs.readFileSync(file, 'utf8');
  if (!/[\$\\]/.test(raw) && !/MathJax|mathjax/.test(raw)) return false;

  let html = stripMathJax(raw);
  const { html: protectedHtml, slots } = protect(html);
  const rendered = renderMathInFragment(protectedHtml, stats);
  html = restore(rendered, slots);

  if (stats.ok > stats._okBefore) {
    html = ensureKatexCss(html);
  }
  stats._okBefore = stats.ok;

  if (html !== raw) {
    fs.writeFileSync(file, html);
    return true;
  }
  return false;
}

function main() {
  if (!fs.existsSync(publicDir)) {
    console.error('public/ missing — run hugo first');
    process.exit(1);
  }
  if (!fs.existsSync(katexDist)) {
    console.error('katex not installed — run npm ci');
    process.exit(1);
  }

  copyKatexAssets();

  const files = walkHtmlFiles(publicDir);
  const stats = { attempted: 0, ok: 0, failed: 0, errors: [], changed: 0, _okBefore: 0 };
  const perFile = [];

  for (const file of files) {
    const before = { attempted: stats.attempted, ok: stats.ok, failed: stats.failed };
    stats._okBefore = stats.ok;
    const changed = processFile(file, stats);
    if (changed) {
      stats.changed++;
      perFile.push({
        file: path.relative(publicDir, file),
        attempted: stats.attempted - before.attempted,
        ok: stats.ok - before.ok,
        failed: stats.failed - before.failed,
      });
    }
  }

  console.log(`Math render: ${stats.changed} HTML files updated`);
  console.log(`  expressions: ${stats.ok} ok, ${stats.failed} failed, ${stats.attempted} attempted`);
  for (const f of perFile.filter((x) => x.failed > 0 || x.attempted > 0)) {
    if (f.attempted === 0) continue;
    console.log(`  - ${f.file}: ${f.ok}/${f.attempted} ok` + (f.failed ? ` (${f.failed} failed)` : ''));
  }
  if (stats.errors.length) {
    console.log('\nFirst failures:');
    for (const e of stats.errors.slice(0, 25)) {
      console.log(`  ! ${e.message}`);
      console.log(`    ${e.tex.replace(/\s+/g, ' ')}`);
    }
    if (stats.errors.length > 25) console.log(`  … ${stats.errors.length - 25} more`);
  }

  // Non-zero exit if many failures — still wrote error placeholders so pages are inspectable.
  const failRate = stats.attempted ? stats.failed / stats.attempted : 0;
  if (failRate > 0.05 && stats.failed > 5) {
    console.error(`\nHigh failure rate (${(failRate * 100).toFixed(1)}%) — inspect katex-error markers`);
    process.exit(2);
  }
}

main();
