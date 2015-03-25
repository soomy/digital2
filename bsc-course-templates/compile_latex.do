#!/bin/bash
# Number of arguments = $#
# script name = $0
# first argument = $1
if [ $# -eq 0 ]; then
   echo "Usage: $0 <toplevel latex file name without extension> [booklet]"
   exit 1;
fi
if [ $# -gt 2 ]; then
   echo "Usage: $0 <toplevel latex file name without extension> [booklet]"
   exit 1;
fi

export MAINSHEET=${1/.tex/}
export TEXINPUTS=../tex:../figs:../:../sty:../tplpictures:$TEXINPUTS
if [ -a latex_includes ]; then
   source latex_includes
fi
rm -rf sandbox
mkdir -p figs sandbox pdf
cd figs
ls *.fig | while read filename;\
do fig2dev -L eps $filename "../sandbox/${filename%%'.fig'}.eps";\
fig2dev -L pstex $filename "../sandbox/${filename%%'.fig'}.pstex";\
fig2dev -L pstex_t -p "${filename%%'.fig'}.pstex" $filename "../sandbox/${filename%%'.fig'}.pstex_t";\
done
cd ../sandbox
latex ${MAINSHEET}.tex
bibtex ${MAINSHEET}
latex ${MAINSHEET}.tex
latex ${MAINSHEET}.tex
dvips `(basename ${MAINSHEET})`.dvi
ps2pdf -dEmbedAllFonts=true `(basename ${MAINSHEET})`.ps ../pdf/`(basename ${MAINSHEET})`.pdf
#to make a booklet out of it
if [ "$2" == "booklet" ]; then
psbook `(basename ${MAINSHEET})`.ps tmp1.ps
psnup -Pa5 -pa4 -2 tmp1.ps tmp2.ps
ps2pdf -dEmbedAllFonts=true -sPAPERSIZE=a4 tmp2.ps ../pdf/`(basename ${MAINSHEET})`_booklet.pdf
echo For the booklet: print double sided short-edge!
fi
cd ..
evince pdf/`(basename ${MAINSHEET})`.pdf
