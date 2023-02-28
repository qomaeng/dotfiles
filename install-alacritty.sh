#!/usr/bin/env bash

set -o nounset

BASEDIR=$(dirname "$BASH_SOURCE[0]")

echo "Linking alacritty environments..."

out=$(ln -srf "$BASEDIR/alacritty/config" "$HOME/.config/alacritty" 2>&1)
res=$?; if [ $res -ne 0 ]; then
  echo "  -> failed: $out"
  exit $res
fi

