#!/bin/bash

SC="$(dirname "$(spicetify -c)")"

cp $SC/Themes/Fluent/fluent.js $SC/Extensions/

spicetify config inject_css 1 replace_colors 1 overwrite_assets 1
spicetify config extensions fluent.js
spicetify config color_scheme dark
spicetify config current_theme Fluent
spicetify apply
