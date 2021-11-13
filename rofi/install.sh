#!/bin/sh

BASEDIR=$(dirname "$0")

printf ":: Installing rofi...\n"

######################################################################
# Link rofi
######################################################################

printf "Linking \"$HOME/.config/rofi\" -> \"$BASEDIR/.config/rofi\"\n"

errmsg=$(ln -srf "$BASEDIR/.config/rofi" -t "$HOME/.config" 2>&1 >/dev/null)
res=$?; if [ $res -ne 0 ]; then
  printf "  -> failed: $errmsg\n"
  exit $res
fi

