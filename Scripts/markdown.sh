#!/bin/bash

# requires md2pdf python utility from the AUR
md2pdf $1 -o /tmp/pdf.pdf
zathura /tmp/pdf.pdf

# remove the file when done
rm /tmp/pdf.pdf
