/**
 * Shrink build-time KaTeX HTML without changing layout or accessibility.
 *
 * KaTeX's visual tree is a deep stack of spans whose class strings come from a
 * small set (dozens, not thousands) plus a few hundred distinct inline styles.
 * Each span becomes a short unknown element named for its class string, and
 * each inline style becomes a shared class. The KaTeX stylesheet is rewritten
 * so those elements match the original selectors. Specificity of an n-class
 * compound is preserved by repeating :is() n times.
 *
 * The MathML stays in place, in reading order, visually hidden by KaTeX's
 * .katex-mathml rule. The visual tree stays aria-hidden on .katex-html.
 * Hoisted styles are !important so they beat stylesheet rules the way inline
 * styles did. KaTeX's own !important declarations do not set those properties.
 */
const OUTER_ATTR = 'class="katex-html"';

function base36(n) {
  const chars = '0123456789abcdefghijklmnopqrstuvwxyz';
  let s = '';
  let x = n;
  do {
    s = chars[x % 36] + s;
    x = Math.floor(x / 36);
  } while (x > 0);
  return s;
}

export function createVocab() {
  return { classCounts: new Map(), styleCounts: new Map() };
}

function findKatexHtmlFragments(html) {
  const out = [];
  let from = 0;
  while (from < html.length) {
    const at = html.indexOf(OUTER_ATTR, from);
    if (at < 0) break;
    const open = html.lastIndexOf('<span', at);
    if (open < 0 || at - open > 80) {
      from = at + OUTER_ATTR.length;
      continue;
    }
    let i = html.indexOf('>', at) + 1;
    let depth = 1;
    while (i < html.length && depth > 0) {
      if (html.startsWith('<span', i)) {
        depth += 1;
        i = html.indexOf('>', i) + 1;
        continue;
      }
      if (html.startsWith('</span>', i)) {
        depth -= 1;
        i += 7;
        continue;
      }
      i += 1;
    }
    out.push([open, i]);
    from = i;
  }
  return out;
}

function walkSpans(fragment, visit) {
  // fragment includes the outer katex-html span. visit() sees inner spans only.
  let i = fragment.indexOf('>') + 1;
  let svg = 0;
  while (i < fragment.length) {
    if (fragment[i] !== '<') {
      const next = fragment.indexOf('<', i);
      i = next < 0 ? fragment.length : next;
      continue;
    }
    if (fragment.startsWith('</', i)) {
      const gt = fragment.indexOf('>', i);
      const name = fragment.slice(i + 2, gt).trim();
      if (name === 'svg') svg -= 1;
      i = gt + 1;
      continue;
    }
    const gt = fragment.indexOf('>', i);
    const token = fragment.slice(i, gt + 1);
    const nameMatch = /^<([a-zA-Z][\w-]*)/.exec(token);
    const name = nameMatch ? nameMatch[1] : '';
    if (name === 'svg') svg += 1;
    if (svg === 0 && name === 'span') visit(token);
    i = gt + 1;
  }
}

function spanClassAndStyle(token) {
  const cls = /class="([^"]*)"/.exec(token);
  const style = /style="([^"]*)"/.exec(token);
  return {
    classes: cls ? cls[1] : '',
    style: style ? style[1] : null,
  };
}

export function scanHtml(html, vocab) {
  for (const [start, end] of findKatexHtmlFragments(html)) {
    walkSpans(html.slice(start, end), (token) => {
      const { classes, style } = spanClassAndStyle(token);
      vocab.classCounts.set(classes, (vocab.classCounts.get(classes) || 0) + 1);
      if (style != null) vocab.styleCounts.set(style, (vocab.styleCounts.get(style) || 0) + 1);
    });
  }
}

function rank(map) {
  return [...map.entries()].sort((a, b) => b[1] - a[1] || (a[0] < b[0] ? -1 : a[0] > b[0] ? 1 : 0));
}

export function finalizeVocab(vocab) {
  const byClass = new Map();
  const elements = [];
  rank(vocab.classCounts).forEach(([classes], i) => {
    const tag = `k${base36(i)}`;
    byClass.set(classes, tag);
    elements.push({ tag, classes: new Set(classes.split(/\s+/).filter(Boolean)) });
  });
  const byStyle = new Map();
  rank(vocab.styleCounts).forEach(([style], i) => {
    byStyle.set(style, `s${base36(i)}`);
  });
  const innerTokens = new Set();
  for (const el of elements) for (const token of el.classes) innerTokens.add(token);
  vocab.byClass = byClass;
  vocab.byStyle = byStyle;
  vocab.elements = elements;
  vocab.innerTokens = innerTokens;
  return vocab;
}

function textOf(html) {
  return html.replace(/<[^>]+>/g, '');
}

function transformFragment(fragment, vocab) {
  const gt = fragment.indexOf('>');
  let out = fragment.slice(0, gt + 1);
  let i = gt + 1;
  const stack = [];
  let svg = 0;
  while (i < fragment.length) {
    if (fragment[i] !== '<') {
      const next = fragment.indexOf('<', i);
      const end = next < 0 ? fragment.length : next;
      out += fragment.slice(i, end);
      i = end;
      continue;
    }
    const gt = fragment.indexOf('>', i);
    if (fragment.startsWith('</', i)) {
      const name = fragment.slice(i + 2, gt).trim();
      if (name === 'svg') svg -= 1;
      if (svg === 0 && name === 'span' && stack.length) {
        out += `</${stack.pop()}>`;
      } else {
        out += fragment.slice(i, gt + 1);
      }
      i = gt + 1;
      continue;
    }
    const token = fragment.slice(i, gt + 1);
    const nameMatch = /^<([a-zA-Z][\w-]*)/.exec(token);
    const name = nameMatch ? nameMatch[1] : '';
    const selfClosing = token.endsWith('/>');
    if (name === 'svg') svg += 1;
    if (svg === 0 && name === 'span' && !selfClosing) {
      const { classes, style } = spanClassAndStyle(token);
      const tag = vocab.byClass.get(classes);
      if (!tag) throw new Error(`KaTeX compact: unseen class ${JSON.stringify(classes)}`);
      let attr = '';
      if (style != null) {
        const id = vocab.byStyle.get(style);
        if (!id) throw new Error(`KaTeX compact: unseen style ${style}`);
        attr = ` class=${id}`;
      }
      const rest = token
        .slice(5, -1)
        .replace(/\s*class="[^"]*"/g, '')
        .replace(/\s*style="[^"]*"/g, '')
        .trim();
      if (rest) attr += ` ${rest}`;
      out += `<${tag}${attr}>`;
      stack.push(tag);
    } else {
      out += token;
    }
    i = gt + 1;
  }
  if (stack.length) throw new Error('KaTeX compact: unclosed span');
  if (textOf(out) !== textOf(fragment)) {
    throw new Error('KaTeX compact: text content changed');
  }
  return out;
}

export function compactHtml(html, vocab) {
  const ranges = findKatexHtmlFragments(html);
  if (!ranges.length) return html;
  let out = '';
  let cursor = 0;
  for (const [start, end] of ranges) {
    out += html.slice(cursor, start);
    out += transformFragment(html.slice(start, end), vocab);
    cursor = end;
  }
  out += html.slice(cursor);
  return out;
}

function tagsFor(elements, tokens) {
  const tags = [];
  for (const el of elements) {
    let ok = true;
    for (const token of tokens) {
      if (!el.classes.has(token)) {
        ok = false;
        break;
      }
    }
    if (ok) tags.push(el.tag);
  }
  return tags;
}

function rewriteSelector(selector, vocab) {
  if (!vocab.elements.length) return selector;
  const { elements, innerTokens } = vocab;
  let next = selector.replace(/(\.[_a-zA-Z][\w-]*)+/g, (seq) => {
    const tokens = seq.split('.').filter(Boolean);
    if (!tokens.every((token) => innerTokens.has(token))) return seq;
    const tags = tagsFor(elements, tokens);
    if (!tags.length) return seq;
    const group = `:is(${tags.join(',')})`;
    return group.repeat(tokens.length);
  });
  const all = elements.map((el) => el.tag).join(',');
  next = next.replace(/(^|[^-\w])span(?![\w-])/g, `$1:is(${all})`);
  return next;
}

function splitRules(css) {
  const rules = [];
  let i = 0;
  while (i < css.length) {
    if (css.startsWith('/*', i)) {
      const end = css.indexOf('*/', i + 2);
      rules.push({ kind: 'raw', text: css.slice(i, end + 2) });
      i = end + 2;
      continue;
    }
    const brace = css.indexOf('{', i);
    if (brace < 0) {
      if (css.slice(i).trim()) rules.push({ kind: 'raw', text: css.slice(i) });
      break;
    }
    const selector = css.slice(i, brace);
    let depth = 1;
    let j = brace + 1;
    while (j < css.length && depth > 0) {
      if (css.startsWith('/*', j)) {
        j = css.indexOf('*/', j + 2) + 2;
        continue;
      }
      const ch = css[j];
      if (ch === '{') depth += 1;
      else if (ch === '}') depth -= 1;
      j += 1;
    }
    rules.push({ kind: 'rule', selector, body: css.slice(brace, j) });
    i = j;
  }
  return rules;
}

function isAtRule(selector) {
  return selector.replace(/\/\*[\s\S]*?\*\//g, '').trim().startsWith('@');
}

function styleRule(id, style) {
  const decls = style
    .split(';')
    .map((part) => part.trim())
    .filter(Boolean)
    .map((part) => (part.endsWith('!important') ? part : `${part}!important`));
  return `.katex .${id}{${decls.join(';')}}`;
}

export function rewriteCss(css, vocab) {
  let out = '/* katex-compact */\n';
  for (const rule of splitRules(css)) {
    if (rule.kind === 'raw') {
      out += rule.text;
      continue;
    }
    const selector = isAtRule(rule.selector) ? rule.selector : rewriteSelector(rule.selector, vocab);
    out += selector + rule.body;
  }
  if (vocab.byStyle) {
    for (const [style, id] of vocab.byStyle) out += styleRule(id, style);
  }
  return out;
}
