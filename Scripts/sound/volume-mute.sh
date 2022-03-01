#!/bin/bash

pactl set-sink-mute @DEFAULT_SINK@ toggle

exec ~/.scripts/sound/dunst-volume-refresh.sh
