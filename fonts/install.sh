#!/usr/bin/env /bin/bash

BASEDIR=$(dirname "$0")

printf ":: Installing fonts...\n"

######################################################################
# Link nerd-fonts
######################################################################

printf "(1/2) Linking \"$HOME/.local/share/fonts/NerdFonts\" -> \"$BASEDIR/.local/share/fonts/NerdFonts\"\n"

mkdir -p "$HOME/.local/share/fonts" &>/dev/null

errmsg=$(ln -srf "$BASEDIR/.local/share/fonts/NerdFonts" -t "$HOME/.local/share/fonts" 2>&1 >/dev/null)
res=$?; if [ $res -ne 0 ]; then
  printf "  -> failed: $errmsg\n"
  exit $res
fi

######################################################################
# Link fontconfig
######################################################################

printf "(2/2) Linking \"$HOME/.config/fontconfig\" -> \"$BASEDIR/.config/fontconfig\"\n"

errmsg=$(ln -srf "$BASEDIR/.config/fontconfig" -t "$HOME/.config" 2>&1 >/dev/null)
res=$?; if [ $res -ne 0 ]; then
  printf "  -> failed: $errmsg\n"
  exit $res
fi

