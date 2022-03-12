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
echo "INSTALLING ALL SOFTWARE"
sudo pacman -S $(cat paclist)


echo "INSTALLING ROSE-PINE-GTK"
wget https://github.com/rose-pine/gtk/releases/download/v2.0.0/AllRosePineThemesGTK.tar.gz
wget https://github.com/rose-pine/gtk/releases/download/v2.0.0/AllRosePineThemesIcons.tar.gz

tar xf AllRosePineThemesGTK.tar.gz
tar xf AllRosePineThemesIcons.tar.gz
rm AllRosePineThemesGTK.tar.gz
rm AllRosePineThemesIcons.tar.gz

sudo cp -r AllRosePineThemesGTK/rose-pine-gtk /usr/share/themes
sudo cp -r AllRosePineThemesIcons/rose-pine-icons /usr/share/icons

rm -rf AllRosePineThemesGTK
rm -rf AllRosePineThemesIcons

# reminder
echo 'reminders for myself:

- download ssh keys and install em in .ssh

- git clone https://github.com/enolgor/ungoogled-chromium-extension-installer
  and install

- start firefox and move userchrome to new profile

- grab arkenfox user.js and my overrides from git@github.com:the-argus/functional-dots

- get eduroam and stuff from mediafire
'