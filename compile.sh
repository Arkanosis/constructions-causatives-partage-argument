#! /bin/zsh

repeat 3; do
  pdflatex fs.tex
done

mv fs.pdf "Formalismes syntaxiques.`svn info | sed -ne 's/Revision: \([[:digit:]]\+\)/\1/p'`.pdf"