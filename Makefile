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

## Pandoc options
OPTS := --filter pandoc-crossref --filter pandoc-citeproc --bibliography $(BIB) --latex-engine=xelatex --latex-engine-opt="--shell-escape"

## Output pdfs
PDFS := thesis.pdf abstract.pdf

## Tell the user what we're doing
define print-info =
  @notify-send "Pandocking $@"
  echo "Pandocking $@. New files:"
  for src in $?; do \
    echo "  $$src"; \
  done
endef

default: $(PDFS)

thesis.pdf: $(SRC) $(BIB)
	@$(print-info)
	@pandoc $(SRC) -o $@ $(OPTS)
	@echo "Done."
	@notify-send "$@ finished building"

abstract.pdf: $(ABSTRACT_SRC) $(BIB)
	@$(print-info)
	@pandoc $(ABSTRACT_SRC) -o $@ $(OPTS)
	@echo "Done."
	@notify-send "$@ finished building"

.PHONY: watch clean

watch:
	@echo "Waiting for changes"
	@inotifywait -rmq -e close_write $(CONTENT) | while read path action file; do \
	  echo; \
	  echo "$$(date --rfc-3339=seconds): $$action $$file"; \
          jobs -p | xargs kill 2> /dev/null; \
	  (make --no-print-directory 2>/dev/null) & \
	done

clean:
	rm $(PDFS)
