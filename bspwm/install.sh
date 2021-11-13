#!/bin/sh

BASEDIR=$(dirname "$0")

printf ":: Installing bspwm...\n"

######################################################################
# Link bspwm
######################################################################

printf "Linking \"$HOME/.config/bspwm\" -> \"$BASEDIR/.config/bspwm\"\n"

errmsg=$(ln -srf "$BASEDIR/.config/bspwm" -t "$HOME/.config" 2>&1 >/dev/null)
res=$?; if [ $res -ne 0 ]; then
  printf "  -> failed: $errmsg\n"
  exit $res
fi

