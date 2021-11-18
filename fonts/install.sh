#!/usr/bin/env sh

BASEDIR=$(dirname "$0")

printf ":: Installing fonts...\n"

######################################################################
# Link .config/alacritty
######################################################################

printf "Linking \"$HOME/.local/share/fonts/NerdFonts\" -> \"$BASEDIR/.local/share/fonts/NerdFonts\"\n"

mkdir -p "$HOME/.local/share/fonts" &>/dev/null

errmsg=$(ln -srf "$BASEDIR/.local/share/fonts/NerdFonts" -t "$HOME/.local/share/fonts" 2>&1 >/dev/null)
res=$?; if [ $res -ne 0 ]; then
  printf "  -> failed: $errmsg\n"
  exit $res
fi

