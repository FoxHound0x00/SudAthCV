TARGET = cv

AUX_FILES = \
	$(TARGET).aux $(TARGET).log $(TARGET).out \
	$(TARGET).toc $(TARGET).lof $(TARGET).lot \
	$(TARGET).fls $(TARGET).fdb_latexmk $(TARGET).synctex.gz \
	$(TARGET).bbl $(TARGET).blg $(TARGET).bcf $(TARGET).run.xml

all: $(TARGET).pdf

$(TARGET).pdf: $(TARGET).tex
	pdflatex $(TARGET).tex
	biber $(TARGET)
	pdflatex $(TARGET).tex
	pdflatex $(TARGET).tex

clean:
	rm -f $(AUX_FILES)

distclean: clean
	rm -f $(TARGET).pdf

.PHONY: all clean distclean
