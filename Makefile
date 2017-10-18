## Markdown extension (e.g. md, markdown, mdown).
MEXT := md

## Content folder
CONTENT := content

## All markdown files in the working directory
ABSTRACT := abstract.md
ABSTRACT_SRC := $(CONTENT)/$(ABSTRACT)
ABSTRACT_FR := résumé.md
ABSTRACT_FR_SRC := $(CONTENT)/$(ABSTRACT_FR)
SRC = $(sort $(filter-out $(ABSTRACT_SRC) $(ABSTRACT_FR_SRC),$(wildcard $(CONTENT)/*.$(MEXT))))

## Location of Pandoc support files.
#PREFIX = $(HOME)/.pandoc

## Location of your working bibliography file
BIB_SRC := $(CONTENT)/bibliography.bib
BIB := $(CONTENT)/bibliography-fixed.bib

## CSL stylesheet (located in the csl folder of the PREFIX directory).
#CSL = apsa

## Pandoc options
OPTS := --filter pandoc-crossref --biblatex --bibliography $(BIB)

## Output pdfs
PDFS := thesis.pdf abstract.pdf résumé.pdf

## Tell the user what we're doing
define print-info =
  notify-send "Pandocking $@" "New files:\n  $$(echo $? | sed 's/ /\n  /g')"
  echo "Pandocking $@. New files:"
  for src in $?; do \
    echo "  $$src"; \
  done
endef

default: $(PDFS)

$(BIB): $(BIB_SRC)
	@cat $(BIB_SRC) | sed 's/age--acquisition/age-of-acquisition/g' > $(BIB)

thesis.pdf: $(SRC) $(BIB)
	@$(print-info)
	pandoc $(SRC) -s -o $(patsubst %.pdf,%.tex,$@) $(OPTS)
	latexmk -xelatex -latexoption="--shell-escape" $(patsubst %.pdf,%.tex,$@)
	@echo "Done."
	@notify-send "Pdf built" "$@ finished pandocking"

abstract.pdf: $(ABSTRACT_SRC) $(BIB)
	@$(print-info)
	@pandoc $(ABSTRACT_SRC) -s -o $(patsubst %.pdf,%.tex,$@) $(OPTS)
	@latexmk -xelatex -latexoption="--shell-escape" $(patsubst %.pdf,%.tex,$@)
	@echo "Done."
	@notify-send "Pdf built" "$@ finished pandocking"

résumé.pdf: $(ABSTRACT_FR_SRC) $(BIB)
	@$(print-info)
	@pandoc $(ABSTRACT_FR_SRC) -s -o $(patsubst %.pdf,%.tex,$@) $(OPTS)
	@latexmk -xelatex -latexoption="--shell-escape" $(patsubst %.pdf,%.tex,$@)
	@echo "Done."
	@notify-send "Pdf built" "$@ finished pandocking"

.PHONY: watch clean

watch:
	@echo "Waiting for changes"
	@inotifywait -rmq -e close_write $(CONTENT) | while read path action file; do \
	  echo; \
	  echo "$$(date --rfc-3339=seconds): $$action $$file"; \
          jobs -p | xargs kill 2> /dev/null; \
	  (make --no-print-directory) & \
	done

clean:
	rm $(PDFS)
