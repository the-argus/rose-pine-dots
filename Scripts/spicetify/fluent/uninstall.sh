#!/bin/bash

SC="$(dirname "$(spicetify -c)")"

# remove extension file
rm $SC/Extensions/fluent.js

# deselect the extension
spicetify config extensions fluent.js-

spicetify config inject_css 0 replace_colors 0 overwrite_assets 0
spicetify config current_theme SpicetifyDefault
spicetify config color_scheme base
spicetify apply
