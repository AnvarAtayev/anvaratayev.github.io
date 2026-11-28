# anvaratayev.com

Personal site. Hugo (hugo-book theme), built with `./bin/build` (Pandoc bibliography, `hugo --minify`, then KaTeX) and deployed to GitHub Pages.

## Building locally

Install the same releases the pull-request check and the production deploy install. A newer local Hugo can accept templates the pinned release rejects.

- **Hugo** at the version in [`.github/hugo-version`](.github/hugo-version). Hugo 0.170.0 retired the extended edition: one standard binary now includes the former extended features, and SCSS is transpiled by Dart Sass instead of embedded LibSass. CI installs `hugo_<version>_linux-amd64.deb`.
- **Dart Sass** at the version in [`.github/dart-sass-version`](.github/dart-sass-version), on `PATH` as `sass`. The hugo-book stylesheet is SCSS (`css.Sass`).
- Pandoc, Node.js, and npm (`npm ci` installs KaTeX).

```bash
./bin/build
```

## Continuous integration

Pull requests targeting `main` run that same build and do not deploy. A failed build fails the check. Pushes to `main`, and manual runs of the deploy workflow, still publish to GitHub Pages.
