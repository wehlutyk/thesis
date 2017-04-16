## Markdown extension (e.g. md, markdown, mdown).
MEXT := md

## Content folder
CONTENT := content

## All markdown files in the working directory
SRC = $(sort $(wildcard $(CONTENT)/*.$(MEXT)))

## Location of Pandoc support files.
#PREFIX = $(HOME)/.pandoc

## Location of your working bibliography file
BIB := $(CONTENT)/bibliography.bib

## CSL stylesheet (located in the csl folder of the PREFIX directory).
#CSL = apsa

## Output pdf
PDF := thesis.pdf

default: $(PDF)

$(PDF): $(SRC) $(BIB)
	pandoc $(SRC) -o $@ --filter pandoc-citeproc --bibliography $(BIB) --latex-engine=xelatex

.PHONY: watch clean

watch:
	@inotifywait -r -m -e close_write $(CONTENT) | while read path action file; do echo; echo "$$(date --rfc-3339=seconds): $$action $$file"; make --no-print-directory; done

clean:
	rm $(PDF)
