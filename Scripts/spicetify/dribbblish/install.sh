#!/bin/bash

SC="$(dirname "$(spicetify -c)")"

cp $SC/Themes/Dribbblish/dribbblish.js $SC/Extensions/

spicetify config inject_css 1 replace_colors 1 overwrite_assets 1
spicetify config extensions dribbblish.js
spicetify config color_scheme rosepine
spicetify config current_theme Dribbblish
spicetify apply
