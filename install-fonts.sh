#!/usr/bin/env bash

set -o nounset

BASEDIR=$(dirname "${BASH_SOURCE[0]}")

echo ":: Installing fonts..."

######################################################################
# Link fonts
######################################################################

echo "(1/1) Linking \"$HOME/.local/share/fonts\" -> \"$BASEDIR/fonts\""

rm -rf "$HOME/.local/share/fonts"

errmsg=$(ln -srnf "$BASEDIR/fonts" "$HOME/.local/share/fonts" 2>&1)
res=$?; if [ $res -ne 0 ]; then
  echo "  -> failed: $errmsg"
  exit $res
fi

fc-cache

