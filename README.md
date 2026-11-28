# anvaratayev.com

Personal site. Hugo (hugo-book theme), built with `./bin/build` (Pandoc bibliography, `hugo --minify`, then KaTeX) and deployed to GitHub Pages.

## Building locally

Install **Hugo extended** at the version in [`.github/hugo-version`](.github/hugo-version). Pull-request checks and the production deploy both install that exact extended release, so a newer local Hugo can accept templates that the pinned version rejects.

Pandoc, Node.js, and npm are also required (`npm ci` installs KaTeX).

```bash
./bin/build
```

## Continuous integration

Pull requests targeting `main` run that same build and do not deploy. A failed build fails the check. Pushes to `main`, and manual runs of the deploy workflow, still publish to GitHub Pages.
