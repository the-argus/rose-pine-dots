#!/bin/bash

# rofi themes originally by:
## Author  : Aditya Shakya
## Mail    : adi1090x@gmail.com
## Github  : @adi1090x
## Twitter : @adi1090x

rofi_command="rofi -theme $HOME/.config/rofi/powermenu-fullscreen.rasi"

uptime=$(uptime -p | sed -e 's/up //g')
cpu=$($HOME/.config/rofi/usedcpu)
memory=$($HOME/.config/rofi/usedram)

# Options
shutdown=$(echo -e "\uF204")
reboot=$(echo -e "\uF301")
lock=$(echo -e "\uF2A8")
suspend=$(echo -e "\uF2B2")

# Confirmation
function confirm_exit() {
	rofi -dmenu\
		-i\
		-no-fixed-num-lines\
		-p "Are You Sure? : "\
		-theme $HOME/.config/rofi/confirm.rasi
}

# Variable passed to rofi
options="$shutdown\n$reboot\n$lock\n$suspend"

chosen="$(echo -e "$options" | $rofi_command -p "UP - $uptime" -dmenu -selected-row 2)"

case $chosen in
    $shutdown)
		ans=$(confirm_exit &)
		if [[ $ans == "yes" || $ans == "YES" || $ans == "y" || $ans == "Y" ]]; then
			systemctl poweroff
        else
			exit 0
        fi
        ;;
    $reboot)
		ans=$(confirm_exit &)
		if [[ $ans == "yes" || $ans == "YES" || $ans == "y" || $ans == "Y" ]]; then
			systemctl reboot
        else
			exit 0
        fi
        ;;
    $lock)
            $HOME/.scripts/lock.sh
        ;;
    $suspend)
            pactl set-sink-mute @DEFAULT_SINK@ on
			systemctl suspend
        ;;
esac
