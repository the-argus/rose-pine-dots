#!/bin/bash

# locations
SCRIPTS=$HOME/.scripts
CONFIG=$HOME/.config
WALLPAPER=$HOME/.wallpaper
SCREENSHOTS=$HOME/Screenshots
LOCAL=$HOME/.local
ICONS=$HOME/.icons

# create all directories

mkdir -p $CONFIG
mkdir -p $SCRIPTS
mkdir -p $WALLPAPER
mkdir -p $SCREENSHOTS
mkdir -p $LOCAL
mkdir -p $ICONS

# interactively copy this repo's contents

cp -ri Scripts/* $SCRIPTS
cp -ri Config/* $CONFIG
cp -ri Wallpaper/* $WALLPAPER
cp -ri Screenshots/* $SCREENSHOTS
cp -ri Local/* $LOCAL
cp -ri Icons/* $ICONS

echo "COPYING UNGOOGLED CHROMIUM INFO TO ARCH PACMAN.CONF"

curl -s 'https://download.opensuse.org/repositories/home:/ungoogled_chromium/Arch/x86_64/home_ungoogled_chromium_Arch.key' | sudo pacman-key -a -
echo '
[home_ungoogled_chromium_Arch]
SigLevel = Required TrustAll
Server = https://download.opensuse.org/repositories/home:/ungoogled_chromium/Arch/$arch' | sudo tee --append /etc/pacman.conf
sudo pacman -Syu

# install all my packages
sudo pacman -S $(cat paclist)

# reminder
echo 'remember to:

git clone https://github.com/enolgor/ungoogled-chromium-extension-installer
'
