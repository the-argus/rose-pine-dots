#!/bin/bash

# enable dunst
killall -SIGUSR2 dunst
dunst &

# disable mouse button paste
xmousepasteblock &

# locker
# xautolock -time 5 -locker "~/.scripts/lock.sh" -detectsleep &

#$HOME/.scripts/random-xgif.sh
#$HOME/.scripts/random-feh.sh rosepine
#$HOME/.scripts/random-feh.sh dim
#feh --bg-fill $HOME/.wallpaper/fog-forest.jpg
#xgifwallpaper $HOME/.wallpaper/animated/yellow-forest.gif --scale=FILL --scale-filter=PIXEL -d 15 &

nitrogen --restore &

blueman-applet &
nm-applet &
xfce4-clipman &

# sound
pipewire &
pipewire-pulse &
pipewire-media-session &

# razer
openrazer-daemon &

# start picom
picom &
