#!/usr/bin/env /bin/bash

BASEDIR=$(dirname "$0")

printf ":: Installing fonts...\n"

######################################################################
# Link fonts
######################################################################

printf "(1/1) Linking \"$HOME/.local/share/fonts\" -> \"$BASEDIR/fonts\"\n"

rm -rf "$HOME/.local/share/fonts"

errmsg=$(ln -srf "$BASEDIR/fonts" -t "$HOME/.local/share/" 2>&1 >/dev/null)
res=$?; if [ $res -ne 0 ]; then
  printf "  -> failed: $errmsg\n"
  exit $res
fi

