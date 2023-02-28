#!/usr/bin/env bash

set -o nounset

BASEDIR=$(dirname "${BASH_SOURCE[0]}")

echo ":: Installing tmux..."

######################################################################
# Link .zshrc
######################################################################

echo "Linking \"$HOME/.tmux.conf\" -> \"$BASEDIR/tmux/.tmux.conf\""

errmsg=$(ln -srnf "$BASEDIR/tmux/.tmux.conf" "$HOME/.tmux.conf" 2>&1)
res=$?; if [ $res -ne 0 ]; then
  echo "  -> failed: $errmsg"
  exit $res
fi

