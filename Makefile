# Generate documents in the desired output formats.
exclusions=README.md
sources=$(filter-out $(exclusions), $(wildcard *.md))
html_targets=$(sources:.md=.html)
pdf_targets=$(sources:.md=.pdf)
docx_targets=$(sources:.md=.docx)

# Implicit rules
%.html : %.md
	pandoc -s $< -o $@
%.pdf : %.md
	pandoc -s $< -o $@
%.docx : %.md
	pandoc -s $< -o $@

# Targets
all: html pdf docx
html: $(html_targets)
pdf: $(pdf_targets)
docx: $(docx_targets)
clean:
	rm -f $(html_targets) $(pdf_targets) $(docx_targets)

