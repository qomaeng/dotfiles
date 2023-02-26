#!/usr/bin/env bash 

set -o nounset

BASEDIR=$(dirname "$0")

. "$BASEDIR/utils/git.sh"

printf ":: Installing nvim...\n"

######################################################################
# Git sync nvim config
######################################################################

git_sync \
  "$HOME/.config/nvim" \
  "https://github.com/NvChad/NvChad.git" \
  "main"

######################################################################
# Nvim plugins sync
######################################################################

printf "Synchronizing Nvim plugins...\n"

nvim +'hi NormalFloat guibg=#1e222a' +PackerSync
res=$?; if [ $res -ne 0 ]; then
  echo "  -> failed to sync nvim plugins using packer"
  exit $res
fi

