#!/usr/bin/env bash

set -o nounset

BASEDIR=$(dirname "$0")

printf "Linking alacritty environments...\n"

out=$(ln -srf "$BASEDIR/alacritty/config" "$HOME/.config/alacritty" 2>&1)
res=$?; if [ $res -ne 0 ]; then
  echo "  -> failed: $out"
  exit $res
fi

