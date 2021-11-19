#!/usr/bin/env /bin/bash

BASEDIR=$(dirname "$0")

printf ":: Installing wallpapers...\n"

######################################################################
# Link wallpapers
######################################################################

printf "Linking \"$HOME/Pictures/wallpapers\" -> \"$BASEDIR/Pictures/wallpapers\"\n"

if [ ! -d "$HOME/Pictures" ]; then
  errmsg=$(mkdir -p "$HOME/Pictures" 2>&1 >/dev/null)
  res=$?; if [ $res -ne 0 ]; then
    printf "  -> failed: $errmsg\n"
    exit $res
  fi
  printf "  created directory: $HOME/Pictures\n"
fi

errmsg=$(ln -srf "$BASEDIR/Pictures/wallpapers" -t "$HOME/Pictures" 2>&1 >/dev/null)
res=$?; if [ $res -ne 0 ]; then
  printf "  -> failed: $errmsg\n"
  exit $res
fi

