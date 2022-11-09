#!/bin/bash

set -e

./install-fonts.sh
./asdf/install.sh
./install-zsh.sh
./install-nvim.sh
./tmux/install.sh
./xorg/install.sh
./wallpapers/install.sh

