#!/bin/sh

BASEDIR=$(dirname "$0")

printf ":: Installing polybar...\n"

######################################################################
# Link polybar
######################################################################

printf "Linking \"$HOME/.config/polybar\" -> \"$BASEDIR/.config/polybar\"\n"

errmsg=$(ln -srf "$BASEDIR/.config/polybar" -t "$HOME/.config" 2>&1 >/dev/null)
res=$?; if [ $res -ne 0 ]; then
  printf "  -> failed: $errmsg\n"
  exit $res
fi

