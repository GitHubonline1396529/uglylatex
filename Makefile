# Makefile
# Read `config.mk` file (If exist).
-include config.mk

# 通用的临时文件
AUXFILES = \
*.aux \
*.bbl \
*.bcf \
*.blg \
*.fdb_latexmk \
*.fls \
*.log \
*.loc \
*.out \
*.run.xml \
*.soc \
*.toc \
*.xdv


.PHONY: example clear

all:
	@echo "Building project..."

install:
	@echo "Installing to $(PREFIX)"
	cp -r ./texmf-local/* $(PREFIX)/
	cd $(PREFIX) && texhash .

example:
	@echo "Compiling example files..."
	@cd example && for file in *.tex; do \
		echo "Compiling $$file"; \
		latexmk -xelatex $$file; \
	done
	@cp example/*.pdf texmf-local/doc/
	@echo "All PDFs have been copied to ./texmf-local/doc/"

clear:
	@cd example && rm $(AUXFILES) *.pdf