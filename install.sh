#!/bin/bash

./install-fonts.sh || exit
./asdf/install.sh || exit
./install-zsh.sh || exit
./install-nvim.sh || exit
./tmux/install.sh || exit
./xorg/install.sh || exit
./alacritty/install.sh || exit
./wallpapers/install.sh || exit

