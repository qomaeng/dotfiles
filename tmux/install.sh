#!/bin/sh

BASEDIR=$(dirname "$0")

printf ":: Installing tmux...\n"

######################################################################
# Link .zshrc
######################################################################

printf "Linking \"$HOME/.tmux.conf\" -> \"$BASEDIR/.tmux.conf\"\n"

errmsg=$(ln -srf "$BASEDIR/.tmux.conf" -t "$HOME" 2>&1 >/dev/null)
res=$?; if [ $res -ne 0 ]; then
  printf "  -> failed: $errmsg\n"
  exit $res
fi

