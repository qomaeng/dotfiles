#!/bin/sh

./fonts/install.sh || exit
./asdf/install.sh || exit
./zsh/install.sh || exit
./nvim/install.sh || exit
./tmux/install.sh || exit
./xorg/install.sh || exit
./alacritty/install.sh || exit
./bspwm/install.sh || exit
./sxhkd/install.sh || exit
./polybar/install.sh || exit
./picom/install.sh || exit
./rofi/install.sh || exit
./feh/install.sh || exit
./wallpapers/install.sh || exit

