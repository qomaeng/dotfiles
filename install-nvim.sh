#!/usr/bin/env /bin/bash

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

res=$?; [ $res -ne 0 ] && exit $res

######################################################################
# Nvim plugins sync
######################################################################

printf "Synchronizing Nvim plugins...\n"

nvim +'hi NormalFloat guibg=#1e222a' +PackerSync
res=$?; if [ $res -ne 0 ]; then
  printf "  -> failed to sync nvim plugins using packer\n"
  exit $res
fi

######################################################################
# Install LSP servers
######################################################################

printf "Installing LSP servers...\n"

printf "(1/3) installing golang LSP: golang.org/x/tools/gopls@latest\n"

out=$(go install golang.org/x/tools/gopls@latest 2>&1 >/dev/null)
res=$?; if [ $res -ne 0 ]; then
  printf "  -> failed: $out"
  exit $res
fi
  
printf "(2/3) installing python LSP: pyright\n"

out=$(yarn global add pyright 2>&1 >/dev/null)
res=$?; if [ $res -ne 0 ]; then
  printf "  -> failed: $out"
  exit $res
fi

printf "(3/3) installing typescript LSP: typescript-language-server\n"

out=$(yarn global add typescript-language-server 2>&1 >/dev/null)
res=$?; if [ $res -ne 0 ]; then
  printf "  -> failed: $out"
  exit $res
fi
