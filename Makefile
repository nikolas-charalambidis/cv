# Build the CVs locally with pdfLaTeX (same engine as CI). Requires a TeX installation, see README.md.
#   make         check line lengths, then build build/cv-human.pdf and build/cv-ats.pdf
#   make check   only check that no .tex line exceeds 120 characters (CI fails otherwise)
#   make clean   remove the build directory

LATEXMK = latexmk -pdf -outdir=build -file-line-error -halt-on-error -interaction=nonstopmode

.PHONY: all check clean

all: check build/cv-human.pdf build/cv-ats.pdf

build/%.pdf: %.tex
	$(LATEXMK) $<

check:
	@awk 'length > 120 { printf "%s:%d: %d chars\n", FILENAME, FNR, length; bad = 1 } END { exit bad }' *.tex

clean:
	rm -rf build
