#!/bin/sh

CONFDIR=$(dirname "$0")/..

ln -srf "$CONFDIR/.tmux.conf" -t "$HOME"
ln -srf "$CONFDIR/.tool-versions" -t"$HOME"
ln -srf "$CONFDIR/.zshrc" -t "$HOME"
ln -srf "$CONFDIR/.config/alacritty" -t "$HOME/.config"

