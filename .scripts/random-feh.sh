#!/bin/bash

SELECTED="$(find $HOME/.wallpaper/$1 -maxdepth 1 -not -type d |sort -R |tail -$N)"

feh --bg-fill $SELECTED
