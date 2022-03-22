#!/bin/bash

SC="$(dirname "$(spicetify -c)")"

# remove extension file
rm $SC/Extensions/turntable.js

# deselect the extension
spicetify config extensions turntable.js-

spicetify config current_theme SpicetifyDefault
spicetify config color_scheme base
spicetify apply
