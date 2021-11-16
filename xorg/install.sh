#!/usr/bin/env sh

BASEDIR=$(dirname "$0")

printf ":: Installing xorg...\n"

######################################################################
# Link .xserverrc
######################################################################

printf "Linking \"$HOME/.xserverrc\" -> \"$BASEDIR/.xserverrc\"\n"

errmsg=$(ln -srf "$BASEDIR/.xserverrc" -t "$HOME" 2>&1 >/dev/null)
res=$?; if [ $res -ne 0 ]; then
  printf "  -> failed: $errmsg\n"
  exit $res
fi

######################################################################
# Link .xinitrc
######################################################################

printf "Linking \"$HOME/.xinitrc\" -> \"$BASEDIR/.xinitrc\"\n"

errmsg=$(ln -srf "$BASEDIR/.xinitrc" -t "$HOME" 2>&1 >/dev/null)
res=$?; if [ $res -ne 0 ]; then
  printf "  -> failed: $errmsg\n"
  exit $res
fi

######################################################################
# Link .Xmodmap
######################################################################

printf "Linking \"$HOME/.Xmodmap\" -> \"$BASEDIR/.Xmodmap\"\n"

errmsg=$(ln -srf "$BASEDIR/.Xmodmap" -t "$HOME" 2>&1 >/dev/null)
res=$?; if [ $res -ne 0 ]; then
  printf "  -> failed: $errmsg\n"
  exit $res
fi

