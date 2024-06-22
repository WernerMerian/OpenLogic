# Open Logic Project
# Makefile

# YOU DO NOT HAVE TO USE THIS MAKEFILE
# Just run pdflatex on whichever tex file you want to
# compile
# The job of this makefile is to compile *everything*

# Requires `latexmk` [https://www.ctan.org/pkg/latexmk/]
# The PDF of `the open-logic-config` documentation also
# requires `pandoc` [http://pandoc.org/]




# IO

PROJECT        = open-logic

MAIN           = main.tex

BIB_DIR        = bib/
CONTENT_DIR    = content/
ASSETS_DIR     = assets/
PREAMBLE_DIR   = preamble/

CONTENT_FILES  = $(shell find $(CONTENT_DIR) -type f)
ASSET_FILES    = $(shell find $(ASSETS_DIR) -type f)
PREAMBLE_FILES = $(shell find $(PREAMBLE_DIR) -type f)

BUILD_DIR      = build/
MINTED_DIR     = _minted-main/
INKSCAPE_DIR   = svg-inkscape/

OUT_DIR        = out/

FINAL_JOBNAME  = final
FINAL_PDF      = $(FINAL_JOBNAME).pdf
DEBUG_JOBNAME  = debug
DEBUG_PDF      = $(DEBUG).pdf


# LaTeX COMPILER

PACKAGES_DIR   = $(PREAMBLE_DIR)packages/

LATEXMK        = latexmk
LATEXMK_FLAGS  = -pdf -outdir=$(BUILD_DIR) -shell-escape
LATEXMKRD      = .latexmkrd

DEPS           = $(MAIN) $(CONTENT_FILES) $(ASSET_FILES) $(PREAMBLE_FILES) # $(MAIN) $(LATEXMKRD) $(CONTENT_FILES) $(ASSET_FILES) $(PREAMBLE_FILES)


# RULES FORCED TO BE REPLAYED EVERY TIME
# and even if the target is up to date

.PHONY: all final debug clean mrproper


# RULES FOR PRODUCTION

all: final debug


final: $(OUT_DIR)$(FINAL_PDF)

$(OUT_DIR)$(FINAL_PDF): $(BUILD_DIR)$(FINAL_PDF) | $(OUT_DIR)
	cp $< $@

$(BUILD_DIR)$(FINAL_PDF): $(DEPS) | $(BUILD_DIR)
	$(TIME) $(LATEXMK) $(LATEXMK_FLAGS) \
		-jobname=$(FINAL_JOBNAME) \
		-pretex="\AtBeginDocument{\debugfalse}" -usepretex \
		-recorder \
		$(MAIN)


debug: $(OUT_DIR)$(DEBUG_PDF)

$(OUT_DIR)$(DEBUG_PDF): $(BUILD_DIR)$(DEBUG_PDF) | $(OUT_DIR)
	cp $< $@

$(BUILD_DIR)$(DEBUG_PDF): $(DEPS) | $(BUILD_DIR)
	$(TIME) $(LATEXMK) $(LATEXMK_FLAGS) \
		-jobname=$(DEBUG_JOBNAME) \
		-pretex="\AtBeginDocument{\debugtrue}" -usepretex \
		-recorder \
		$(MAIN)


$(BUILD_DIR) $(OUT_DIR):
	mkdir $@


# RULES FOR SOURCE CODE FORMATING

code-formating:
	@echo TODO


# RULES FOR CLEANING

clean:
# start by cleaning the content/ directory from all its section compilation files
	find $(CONTENT_DIR) -type f -not -name "*.tex" -delete
# then remove master compilation directories
	$(RM) -r $(BUILD_DIR) $(MINTED_DIR) $(INKSCAPE_DIR)

mrproper: clean
	$(RM) -r $(OUT_DIR)


# RULES FOR ARCHIVING

tar: mrproper
	tar -cvzf $(PROJECT).tar.gz $(BIB_DIR) $(CONTENT_DIR) $(ASSETS_DIR) $(PREAMBLE_DIR) LICENSE.md README.md Makefile $(MAIN) $(LATEXMKRD)
