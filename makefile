WEBSITE_PDF=$(WEBSITE_DIR)/CV/output.pdf
TEMPLATES=$(shell find templates -type f)
BUILD_DIR=build
PDF=$(BUILD_DIR)/output.pdf
.PHONY: all public viewpdf stage jekyll push clean

all: $(PDF) $(MD)

$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)
  
viewpdf: $(PDF)
	gnome-open $(PDF)

stage: $(PDF) $(MD)
	cp $(PDF) $(WEBSITE_PDF)
	cp $(MD) $(WEBSITE_MD)

jekyll: stage
	cd $(WEBSITE_DIR) && bundle exec jekyll server

push: stage
	git -C $(WEBSITE_DIR) add $(WEBSITE_PDF) $(WEBSITE_MD)

clean:
	rm -rf $(BUILD_DIR)/output*
