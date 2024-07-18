cd tex
pdflatex ./main.tex
pdflatex ./main.tex #Do not remove this, pdflatex should be compiled atleast twice to generate pdf correctly
mv main.pdf ../
rm *log *lof *toc *aux *lot *out