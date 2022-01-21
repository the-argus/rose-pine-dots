#!/bin/bash
backlight_control -10
exec ~/.scripts/backlight/dunst-brightness-refresh.sh $CUR
