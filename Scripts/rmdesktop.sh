#!/bin/bash

cp $1 ~/.local/share/applications
sudo rm $1
sudo ln -s /dev/null $1
echo removed $1
