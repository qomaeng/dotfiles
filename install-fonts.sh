#!/usr/bin/env bash

set -o nounset

BASEDIR=$(dirname "$0")

echo ":: Installing fonts..."

######################################################################
# Link fonts
######################################################################

echo "(1/1) Linking \"$HOME/.local/share/fonts\" -> \"$BASEDIR/fonts\""

rm -rf "$HOME/.local/share/fonts"

errmsg=$(ln -srf "$BASEDIR/fonts" -t "$HOME/.local/share/" 2>&1)
res=$?; if [ $res -ne 0 ]; then
  echo "  -> failed: $errmsg"
  exit $res
fi

fc-cache

