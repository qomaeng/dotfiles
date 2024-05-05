#!/usr/bin/env bash 

set -o nounset

BASEDIR=$(dirname "${BASH_SOURCE[0]}")

. "$BASEDIR/utils/git.sh"

echo ":: Installing nvim plugins..."

######################################################################
# Git sync nvim config
######################################################################

git_sync \
  "$HOME/.config/nvim" \
  "git@github.com:qomaeng/nvim.git" \
  "main"

######################################################################
# Nvim plugins sync
######################################################################

echo "Synchronizing Nvim plugins..."

nvim
res=$?; if [ $res -ne 0 ]; then
  echo "  -> failed to sync nvim plugins"
  exit $res
fi
