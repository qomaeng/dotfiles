#!/usr/bin/env sh

BASEDIR=$(dirname "$0")

printf ":: Installing dunst...\n"

######################################################################
# Link dunst
######################################################################

printf "Linking \"$HOME/.config/dunst\" -> \"$BASEDIR/.config/dunst\"\n"

errmsg=$(ln -srf "$BASEDIR/.config/dunst" -t "$HOME/.config" 2>&1 >/dev/null)
res=$?; if [ $res -ne 0 ]; then
  printf "  -> failed: $errmsg\n"
  exit $res
fi

