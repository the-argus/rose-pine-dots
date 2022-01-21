#!/bin/bash

# enable dunst
killall -SIGUSR2 dunst
dunst &

# disable mouse button paste
xmousepasteblock &

# locker
xautolock -time 5 -locker "i3lock-fancy -f \"Fira-Code-Regular-Nerd-Font-Complete\" -t \"hello, argus.\"" -detectsleep &

#$HOME/.scripts/random-xgif.sh
$HOME/.scripts/random-feh.sh rosepine
#feh --bg-fill $HOME/.wallpaper/Live.jpg

# sound
pipewire &
pipewire-pulse &
pipewire-media-session &

# razer
openrazer-daemon &

# start picom
picom &
