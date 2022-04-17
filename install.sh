#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

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

cp -ri $SCRIPT_DIR/Scripts/* $SCRIPTS
cp -ri $SCRIPT_DIR/Config/* $CONFIG
cp -ri $SCRIPT_DIR/Wallpaper/* $WALLPAPER
cp -ri $SCRIPT_DIR/Screenshots/* $SCREENSHOTS
cp -ri $SCRIPT_DIR/Local/* $LOCAL
cp -ri $SCRIPT_DIR/Icons/* $ICONS

# misc stuff
cp -i $SCRIPT_DIR/.zshrc ~/.zshrc
cp -i $SCRIPT_DIR/.zprofile ~/.zprofile
cp -i $SCRIPT_DIR/.aliases ~/.aliases
cp -i $SCRIPT_DIR/.gtkrc-2.0 ~/.gtkrc-2.0


echo "COPYING UNGOOGLED CHROMIUM INFO TO ARCH PACMAN.CONF"

curl -s 'https://download.opensuse.org/repositories/home:/ungoogled_chromium/Arch/x86_64/home_ungoogled_chromium_Arch.key' | sudo pacman-key -a -
echo '
[home_ungoogled_chromium_Arch]
SigLevel = Required TrustAll
Server = https://download.opensuse.org/repositories/home:/ungoogled_chromium/Arch/$arch' | sudo tee --append /etc/pacman.conf
sudo pacman -Syu

echo "INSTALLING YAY"
git clone https://aur.archlinux.org/yay.git
cd $SCRIPT_DIR/yay
sudo pacman -S go
makepkg
sudo pacman -U *.zst
sudo pacman -Rsn go
cd $SCRIPT_DIR
rm -rf $SCRIPT_DIR/yay

# install all my packages
echo "INSTALLING ALL SOFTWARE"
sudo pacman -S $(cat paclist)
yay -S $(cat yaylist)

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

echo "STARTING FIREFOX AND CUSTOMIZING PROFILE"

echo ">> launching firefox without gui..."
firefox --headless &
# store most recently launched programs PID
FIREFOX_PID = $!
echo ">> sleeping to wait for process..."
sleep 5
echo ">> downloading arkenfox user.js..."
git clone https://github.com/arkenfox/user.js $SCRIPT_DIR/userjs
echo ">> installing arkenfox user.js..."
FDIR=~/.mozilla/firefox/*default-release*/
cp -r $SCRIPT_DIR/userjs/* $FDIR
rm -rf $SCRIPT_DIR/userjs
echo ">> installing my user overrides..."
cp $SCRIPT_DIR/Extra/Firefox/user-overrides.js $FDIR
echo ">> appending user settings..."
$FDIR/updater.sh
echo ">> installing rose pine userchrome..."
cp -r $SCRIPT_DIR/Extra/Firefox/chrome $FDIR

# kill firefox
kill $FIREFOX_PID

echo ">> installing spicetify..."
sudo chmod a+wr /opt/spotify
sudo chmod a+wr /opt/spotify/Apps -R

spicetify backup
BACK=$(pwd)
SC="$(dirname "$(spicetify -c)")"
cd $SC
cd CustomApps
echo ">> installing spicetify marketplace"
git clone https://github.com/spicetify/spicetify-marketplace
spicetify config custom_apps spicetify-marketplace
cd ../Themes
git clone https://github.com/spicetify/spicetify-themes
cp spicetify-themes/* . -r
rmdir spicetify-themes
cd $BACK
echo ">> installing dribbblish theme for spotify"
$SCRIPT_DIR/Scripts/spicetify/dribbblish/install.sh

echo ">> setting zathura and md2pdf as default markdown viewer"
xdg-mime default markdown.desktop text/markdown

# reminder
echo 'reminders for myself:

- install ssh keys, set directory to chmod 700, private key to 600, and
  pub key to 644
'
