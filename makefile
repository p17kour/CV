TEX = pandoc
src = README.md
FLAGS = --pdf-engine=xelatex

output.pdf : $(src)
	$(TEX) $(filter-out $<,$^ ) -o $@ --README=$< $(FLAGS)

.PHONY: clean
clean :
	rm output.pdf
