BUILD_DIR := build
TEX_FILES := $(wildcard *.tex)

SOURCE_FILE := doc.tex
OUTPUT_FILE := $(patsubst %.tex, $(BUILD_DIR)/%.pdf, $(SOURCE_FILE)) 

LATEX := latexmk
LATEX_FLAGS := --shell-escape -pdf -bibtex -output-directory=$(BUILD_DIR) -aux-directory=$(BUILD_DIR)

.PHONY: build
build: $(OUTPUT_FILE)

$(OUTPUT_FILE): $(TEXT_FILES)
	@mkdir -p $(BUILD_DIR)
	@$(LATEX) $(LATEX_FLAGS) $(SOURCE_FILE)
	@rm -f *.pdf
	@cp -f $(OUTPUT_FILE) .

.PHONY: clean
clean:
	@rm -f *.pdf
	@rm -rf $(BUILD_DIR)

