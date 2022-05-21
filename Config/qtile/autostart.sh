#!/bin/bash

# enable dunst
killall -SIGUSR2 dunst
dunst &

#feh --bg-fill $HOME/.wallpaper/fog-forest.jpg
#xgifwallpaper $HOME/.wallpaper/animated/yellow-forest.gif --scale=FILL --scale-filter=PIXEL -d 15 &
$HOME/.fehbg

blueman-applet &
nm-applet &
xfce4-clipman &

xsuspender &
xmousepasteblock &
xclip &

# start picom
picom --config ~/.config/qtile/config/picom.conf &


# qtile-specific configurations
ALACRITTY=$HOME/.config/alacritty/alacritty.yml
STARSHIP=$HOME/.config/starship.toml
rm $ALACRITTY
ln $HOME/.config/qtile/config/alacritty.yml $ALACRITTY
rm $STARSHIP
ln $HOME/.config/qtile/config/starship.toml $STARSHIP
