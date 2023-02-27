#!/usr/bin/env bash 

set -o nounset

BASEDIR=$(dirname "$0")

. "$BASEDIR/utils/git.sh"

echo ":: Installing nvim..."

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

echo "Synchronizing Nvim plugins..."

nvim +'hi NormalFloat guibg=#1e222a' +PackerSync
res=$?; if [ $res -ne 0 ]; then
  echo "  -> failed to sync nvim plugins using packer"
  exit $res
fi

######################################################################
# Link Nvim lua custom
######################################################################

out=$(ln -srf nvim/lua/custom "$HOME/.config/nvim/lua/custom" 2>&1)
res=$?; if [ $res -ne 0 ]; then
  echo "  -> failed to link nvim lua custom"
  echo "     $out"
  exit $res
fi

