#!/bin/bash

# locations
SCRIPTS=$HOME/.scripts
CONFIG=$HOME/.config
WALLPAPER=$HOME/.wallpaper
SCREENSHOTS=$HOME/Screenshots
LOCAL=$HOME/.local
ICONS=$HOME/.icons

# create all directories

mkdir -p $CONFIG
mkdir -p $SCRIPTS
mkdir -p $WALLPAPER
mkdir -p $SCREENSHOTS
mkdir -p $LOCAL
mkdir -p $ICONS

# interactively copy this repo's contents

cp -ri Scripts/* $SCRIPTS
cp -ri Config/* $CONFIG
cp -ri Wallpaper/* $WALLPAPER
cp -ri Screenshots/* $SCREENSHOTS
cp -ri Local/* $LOCAL
cp -ri Icons/* $ICONS
