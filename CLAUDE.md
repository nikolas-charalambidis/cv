# CLAUDE.md

- `cv.tex`: no line longer than 120 characters (CI fails otherwise).
- Prose (summary, `\item` bullets): wrap at 120 characters; continuation lines of an `\item` indented 2 spaces.
- Long `\href` lines: break after the URL with a trailing `%` and continue the link text on the next line, indented 4
  spaces.
- Line breaks inside a paragraph are whitespace in LaTeX: rewrapping must never change the text.
