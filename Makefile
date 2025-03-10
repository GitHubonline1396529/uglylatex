# Makefile for project `UglyLaTeX`
#
# Name: Makefile
# Date: 2025/3/10
# Version: 0.1.0.0
# License: Copyright (c) 2025 Githubonline1396529

# Read `config.mk` file (If exist).
-include config.mk

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

.PHONY: example clear

all:
	@echo "Building project..."

# Install the document class files to local `texmf` directory
install:
	@echo "Installing to $(PREFIX)"
	cp -r ./texmf/* $(PREFIX)/
	cd $(PREFIX) && texhash .

# Build example PDF files
example:
	@echo "Compiling example files..."
	@cd example && for file in $(TEX_FILES); do \
		echo "Compiling $$file"; \
		latexmk -xelatex $$file; \
	done
	@cp example/*.pdf texmf/doc/
	@echo "All PDFs have been copied to ./texmf/doc/"

# Remove all AUX files
clear:
	@cd example && rm $(AUXFILES) *.pdf