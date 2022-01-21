#!/bin/bash

wallpaper[0]=$HOME/.wallpaper/animated/yellow-forest.gif
wallpaper[1]=$HOME/.wallpaper/animated/crescent.gif
#wallpaper[2]=$HOME/.wallpaper/animated/floating-islands.gif
#wallpaper[3]=$HOME/.wallpaper/animated/pixelart-ramen.gif
wallpaper[2]=$HOME/.wallpaper/animated/sunbeams.gif
wallpaper[3]=$HOME/.wallpaper/animated/sunset-town.gif
wallpaper[4]=$HOME/.wallpaper/animated/wasteland.gif
wallpaper[5]=$HOME/.wallpaper/animated/yellow-farm.gif

size=${#wallpaper[@]}
index=$(($RANDOM % size))
selected=${wallpaper[$index]}


xgifwallpaper $selected --scale=FILL --scale-filter=PIXEL -d 15 &
