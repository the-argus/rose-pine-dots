#!/bin/bash

pactl set-sink-volume @DEFAULT_SINK@ -10%

exec ~/.scripts/sound/dunst-volume-refresh.sh
