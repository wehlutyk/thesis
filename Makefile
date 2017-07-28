## Markdown extension (e.g. md, markdown, mdown).
MEXT := md

## Content folder
CONTENT := content

## All markdown files in the working directory
ABSTRACT := abstract.md
ABSTRACT_SRC := $(CONTENT)/$(ABSTRACT)
SRC = $(sort $(filter-out $(ABSTRACT_SRC),$(wildcard $(CONTENT)/*.$(MEXT))))

## Location of Pandoc support files.
#PREFIX = $(HOME)/.pandoc

## Location of your working bibliography file
BIB := $(CONTENT)/bibliography.bib

## CSL stylesheet (located in the csl folder of the PREFIX directory).
#CSL = apsa

## Output pdfs
PDFS := thesis.pdf abstract.pdf

default: $(PDFS)

thesis.pdf: $(SRC) $(BIB)
	pandoc $(SRC) -o $@ --filter pandoc-crossref --filter pandoc-citeproc --bibliography $(BIB) --latex-engine=xelatex --latex-engine-opt="--shell-escape"
	@echo "Done."

abstract.pdf: $(ABSTRACT_SRC) $(BIB)
	pandoc $(ABSTRACT_SRC) -o $@ --filter pandoc-crossref --filter pandoc-citeproc --bibliography $(BIB) --latex-engine=xelatex --latex-engine-opt="--shell-escape"
	@echo "Done."

.PHONY: watch clean

watch:
	@inotifywait -r -m -e close_write $(CONTENT) | while read path action file; do echo; echo "$$(date --rfc-3339=seconds): $$action $$file"; make --no-print-directory; done

clean:
	rm $(PDFS)
