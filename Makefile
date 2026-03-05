# Generate documents in the desired output formats.

# Identify source and target files.
destination=dist/
exclusions:=README.md
sources:=$(filter-out $(exclusions), $(wildcard *.md))
html_targets:=$(patsubst %.md, $(destination)%.html, $(sources))
pdf_targets:=$(patsubst %.md, $(destination)%.pdf, $(sources))
docx_targets:=$(patsubst %.md, $(destination)%.docx, $(sources))

# Options
pandoc_options:=-s -N

# Implicit rules
$(destination)%.html : %.md
	pandoc $(pandoc_options) $< -o $@
$(destination)%.pdf : %.md
	pandoc $(pandoc_options) $< -o $@
$(destination)%.docx : %.md
	pandoc $(pandoc_options) $< -o $@

# Targets
.PHONY: all html pdf docs clean
all: html pdf docx
html: $(html_targets)
pdf: $(pdf_targets)
docx: $(docx_targets)
clean:
	rm -f $(html_targets) $(pdf_targets) $(docx_targets)

