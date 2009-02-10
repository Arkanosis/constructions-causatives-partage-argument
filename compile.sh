#! /bin/zsh

subscribers=(arkanosis@gmail.com)

repeat 3; do
  pdflatex fs.tex
done

filename="Formalismes syntaxiques.`svn info | sed -ne 's/Revision: \([[:digit:]]\+\)/\1/p'`.pdf"

mv fs.pdf "$filename"

if [ $# -eq 1 ] && [ "$1" = '-mail' ]; then
    echo
    for subscriber in $subscribers; do
	echo "\033[32mSending an email to \033[1m$subscriber\033[0m"
	echo 'Build' | mutt -a "$filename" -s "[BUILD] $filename" "$subscriber"
    done
fi