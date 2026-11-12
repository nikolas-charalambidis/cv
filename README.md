# Curriculum Vitae

[https://www.nikolas-charalambidis.com/cv](https://www.nikolas-charalambidis.com/cv)

The CV is generated from LaTeX source files and published in two variants:

- **[`cv-human.pdf`](https://www.nikolas-charalambidis.com/cv/cv-human.pdf)** — A single-page version designed for human readers, with an emphasis on readability and visual presentation.
- **[`cv-ats.pdf`](https://www.nikolas-charalambidis.com/cv/cv-ats.pdf)** — An ATS-friendly version with a single-column layout, designed to improve compatibility with Applicant Tracking Systems that may struggle to parse multi-column documents. Other considerations taken into account: no columns, tables, Font Awesome icons, text boxes, or graphics.

An additional alias is provided for convenience:

- **[`cv.pdf`](https://www.nikolas-charalambidis.com/cv/cv.pdf)** — The default CV endpoint, currently pointing to `cv-ats.pdf`. Intended primarily for automated systems, bots, and web scrapers.

## Building locally

The CVs compile with pdfLaTeX, the same engine as the CI build.

### Install TeX (macOS, one-time)

Pick one of the two options. Open a new terminal afterwards, so that `/Library/TeX/texbin` is on your `PATH`.

**Option A: MacTeX** (about 5 GB). Contains every package, nothing else to install.

```sh
brew install --cask mactex-no-gui
```

**Option B: BasicTeX** (about 100 MB). Small, so the packages the CVs use have to be added.

```sh
brew install --cask basictex
# open a new terminal, then:
sudo tlmgr update --self
sudo tlmgr install latexmk libertine mweights fontaxes xkeyval cmbright hfbright fontawesome7 \
  enumitem microtype needspace fancyhdr xcolor hyperref babel-english
```

### Build

```sh
make          # checks line lengths, then builds build/cv-human.pdf and build/cv-ats.pdf
make check    # only checks that no .tex line exceeds 120 characters (CI fails otherwise)
make clean    # removes the build directory
```

`make` rebuilds a PDF only when its `.tex` file has changed.
