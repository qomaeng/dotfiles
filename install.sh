#!/bin/bash

set -o errexit
set -o nounset

./install-fonts.sh
./install-asdf.sh
./install-zsh.sh
./install-nvim.sh
./install-tmux.sh
./install-wallpapers.sh

