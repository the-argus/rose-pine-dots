#!/bin/bash

DATE=$(echo $(date +"%m_%d_%Y_"))
BASENAME=$(basename "$1")
RMEXT=${BASENAME%".docx"}
OUTPATH="$HOME/Desktop/school/philosophy/"
OUTPATH+=$DATE
OUTPATH+=$RMEXT
echo "DATE: "$DATE
echo "OUTPATH: "$OUTPATH
CPPATH="$HOME/Desktop/school/philosophy/proprietary/"
CPPATH+=$DATE
CPPATH+=$BASENAME
mv "$1" "$CPPATH"

unoconv --output "$OUTPATH" "$CPPATH"
