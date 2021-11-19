#!/usr/bin/env /bin/bash

BASEDIR=$(dirname "$0")

printf ":: Installing sxhkd...\n"

######################################################################
# Link sxhkd
######################################################################

printf "Linking \"$HOME/.config/sxhkd\" -> \"$BASEDIR/.config/sxhkd\"\n"

errmsg=$(ln -srf "$BASEDIR/.config/sxhkd" -t "$HOME/.config" 2>&1 >/dev/null)
res=$?; if [ $res -ne 0 ]; then
  printf "  -> failed: $errmsg\n"
  exit $res
fi

