#!/usr/bin/env sh

BASEDIR=$(dirname "$0")

printf ":: Installing mpd...\n"

######################################################################
# Link polybar
######################################################################

printf "Linking \"$HOME/.config/mpd\" -> \"$BASEDIR/.config/mpd\"\n"

errmsg=$(ln -srf "$BASEDIR/.config/mpd" -t "$HOME/.config" 2>&1 >/dev/null)
res=$?; if [ $res -ne 0 ]; then
  printf "  -> failed: $errmsg\n"
  exit $res
fi

