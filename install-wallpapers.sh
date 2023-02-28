#!/usr/bin/env bash

set -o nounset

BASEDIR=$(dirname "$BASH_SOURCE[0]")

echo ":: Installing wallpapers..."

######################################################################
# Link wallpapers
######################################################################

echo "Linking \"$HOME/Pictures/wallpapers\" -> \"$BASEDIR/wallpapers/Pictures/wallpapers\""

if [ ! -d "$HOME/Pictures" ]; then
  errmsg=$(mkdir -p "$HOME/Pictures" 2>&1)
  res=$?; if [ $res -ne 0 ]; then
    echo "  -> failed: $errmsg"
    exit $res
  fi
  echo "  created directory: $HOME/Pictures"
fi

errmsg=$(ln -srf "$BASEDIR/wallpapers/Pictures/wallpapers" -t "$HOME/Pictures" 2>&1)
res=$?; if [ $res -ne 0 ]; then
  echo "  -> failed: $errmsg"
  exit $res
fi

