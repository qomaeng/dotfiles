#!/usr/bin/env sh

BASEDIR=$(dirname "$0")

printf ":: Installing alacritty...\n"

######################################################################
# Link .config/alacritty
######################################################################

printf "Linking \"$HOME/.config/alarcritty\" -> \"$BASEDIR/.config/alacritty\"\n"

errmsg=$(ln -srf "$BASEDIR/.config/alacritty" -t "$HOME/.config" 2>&1 >/dev/null)
res=$?; if [ $res -ne 0 ]; then
  printf "  -> failed: $errmsg\n"
  exit $res
fi

