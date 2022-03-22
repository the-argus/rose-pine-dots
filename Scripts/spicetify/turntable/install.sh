#!/bin/bash

SC="$(dirname "$(spicetify -c)")"

cp $SC/Themes/Turntable/turntable.js $SC/Extensions/

spicetify config extensions turntable.js
spicetify config color_scheme base
spicetify config current_theme Turntable
spicetify apply
