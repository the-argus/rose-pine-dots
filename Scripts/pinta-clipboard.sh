#!/bin/bash

echo "This script relies on a \"Screenshots\" folder \
    in your home directory, as well as xclip and \
    pngcheck on the AUR"

# Stuff whatever the last clipboard item is into an image
xclip -selection clipboard -t image/png -o > /tmp/pinta-clip.png

# Open up the image with viu and check for an error
checkPNG=$( pngcheck /tmp/pinta-clip.png )
if echo "$checkPNG" | grep -q "ERROR"; then
    echo "No image found in clipboard: $checkPNG"
    TARGETS=$(ls $HOME/Screenshots)
    set -- $TARGETS
    pinta $HOME/Screenshots/$(echo $1)
else
    NAME=$HOME/Screenshots/$(date +"%F_%T").png
    mv /tmp/pinta-clip.png $NAME
    pinta $NAME
fi
