#!/bin/bash
sleep 0.2

i3lock-fancy -f "Fira-Code-Regular-Nerd-Font-Complete" -t "hello, argus."

pactl set-sink-mute @DEFAULT_SINK@ on
~/.scripts/sound/dunst-volume-refresh.sh
