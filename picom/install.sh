#!/usr/bin/env /bin/bash

BASEDIR=$(dirname "$0")

printf ":: Installing picom...\n"

######################################################################
# Link picom
######################################################################

printf "Linking \"$HOME/.config/picom\" -> \"$BASEDIR/.config/picom\"\n"

errmsg=$(ln -srf "$BASEDIR/.config/picom" -t "$HOME/.config" 2>&1 >/dev/null)
res=$?; if [ $res -ne 0 ]; then
  printf "  -> failed: $errmsg\n"
  exit $res
fi

