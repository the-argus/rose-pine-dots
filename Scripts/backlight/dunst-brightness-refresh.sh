#!/bin/bash
# changeVolume

BRIGHTNESS=$(cat /sys/class/backlight/intel_backlight/brightness)
MAX_BRIGHTNESS=$(cat /sys/class/backlight/intel_backlight/max_brightness)
OUT=$(( $BRIGHTNESS*100/$MAX_BRIGHTNESS ))


# send notification with dunst
msgTag='brightness_refresh'
dunstify -a "changeBrightness" -u low -h string:x-dunst-stack-tag:$msgTag \
	-h int:value:"$OUT" "Brightness: ${OUT}%"
