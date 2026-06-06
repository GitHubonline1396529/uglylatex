# Makefile for project `UglyLaTeX`.
#
# Name: Makefile
# Date: 2025/3/10
# Version: 0.1.0.0
# License: Copyright (c) 2025 Githubonline1396529

# Read `config.mk` file (If exist).
-include config.mk

# Variables
PACKAGE_DIR = texmf
PACKAGE_NAME = uglylatex
EXAMPLE_SOURCE = example
README_YAML_HEADER = metadata.yaml

# Universal LaTeX AUX files
AUXFILES = \
*.aux *.bbl *.bcf *.blg \
*.fdb_latexmk *.fls \
*.log *.loc *.out \
*.run.xml \
*.soc *.toc *.xdv

# Manually maintain the list of .tex files
TEX_FILES := \
uglynote-cn.tex \
uglypaper-cn.tex \
uglyrep-cn.tex

# Pandoc options to convert README.md into PDF
# Note don't add anything after backslashes not even comments!
PANDOC_OPTIONS = \
--pdf-engine=xelatex \
--mathjax \
--listing \
--highlight-style=haddock \
--filter pandoc-latex-unlisted \
--shift-heading-level-by=-1 \
--metadata-file=$(README_YAML_HEADER)

ifeq ($(DISTRIBUTION), miktex)
    REFRESH := miktex-console task --update-fndb
else
    REFRESH := texhash .
endif

.PHONY: test example doc clear

all:
	@echo "Building project..."

# Install the document class files to local `texmf` directory
install:
	@echo "Installing to $(TEXMF)"
	cp -r ./$(PACKAGE_DIR)/* $(TEXMF)/
	cd $(TEXMF) && $(REFRESH)

# Compile example PDFs only (no install, for quick testing)
test:
	@echo "Compiling example files..."
	@cd example && for file in $(TEX_FILES); do \
		echo "Compiling $$file"; \
		latexmk -xelatex --shell-escape $$file; \
	done

# Build example PDFs, install to doc/, and convert README
example: test
	@cp $(EXAMPLE_SOURCE)/*.pdf $(PACKAGE_DIR)/doc/$(PACKAGE_NAME)
	@echo "All PDFs have been copied to $(PACKAGE_DIR)/doc/"
	$(MAKE) doc

# Convert README.md into document PDF
doc:
	pandoc README.md $(PANDOC_OPTIONS) \
	--output=$(PACKAGE_DIR)/doc/$(PACKAGE_NAME)/README-cn.pdf

# Remove all AUX files
clear:
	@cd example && rm $(AUXFILES) *.pdf
