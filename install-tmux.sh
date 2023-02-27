#!/usr/bin/env bash

set -o nounset

BASEDIR=$(dirname "$0")

echo ":: Installing tmux..."

######################################################################
# Link .zshrc
######################################################################

echo "Linking \"$HOME/.tmux.conf\" -> \"$BASEDIR/tmux/.tmux.conf\""

errmsg=$(ln -srf "$BASEDIR/tmux/.tmux.conf" -t "$HOME" 2>&1)
res=$?; if [ $res -ne 0 ]; then
  echo "  -> failed: $errmsg"
  exit $res
fi

