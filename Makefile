.PHONY: examples

CC = lualatex
CC_XE = xelatex
EXAMPLES_DIR = examples
RESUME_DIR = examples/resume
CV_DIR = examples/cv
RESUME_SRCS = $(shell find $(RESUME_DIR) -name '*.tex')
CV_SRCS = $(shell find $(CV_DIR) -name '*.tex')

# Add local fontawesome6 to search path (for TeX Live 2025 without fontawesome6)
TEXINPUTS := .:./fontawesome6/tex//:$(TEXINPUTS)
TFMFONTS := .:./fontawesome6/tfm//:$(TFMFONTS)
T1FONTS := .:./fontawesome6/type1//:$(T1FONTS)
ENCFONTS := .:./fontawesome6/enc//:$(ENCFONTS)
OPENTYPEFONTS := .:./fontawesome6/opentype//:$(OPENTYPEFONTS)
export TEXINPUTS TFMFONTS T1FONTS ENCFONTS OPENTYPEFONTS

examples: $(foreach x, coverletter cv resume, $x.pdf)

resume.pdf: $(EXAMPLES_DIR)/resume.tex $(RESUME_SRCS)
	$(CC_XE) -output-directory=$(EXAMPLES_DIR) $<

cv.pdf: $(EXAMPLES_DIR)/cv.tex $(CV_SRCS)
	$(CC) -output-directory=$(EXAMPLES_DIR) $<

coverletter.pdf: $(EXAMPLES_DIR)/coverletter.tex
	$(CC) -output-directory=$(EXAMPLES_DIR) $<

clean:
	rm -rf $(EXAMPLES_DIR)/*.pdf
