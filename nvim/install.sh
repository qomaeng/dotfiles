#!/bin/sh

BASEDIR=$(dirname "$0")

source "$BASEDIR/../utils/git.sh"

printf ":: Installing nvim...\n"

######################################################################
# Git sync nvim config
######################################################################

git_sync \
  "$HOME/.config/nvim" \
  "git@github.com:qomaeng/NvChad.git" \
  "main"

res=$?; [ $res -ne 0 ] && exit $res

######################################################################
# Nvim plugins sync
######################################################################

printf "Synchronizing Nvim plugins...\n"

errmsg=$(nvim +'hi NormalFloat guibg=#1e222a' +PackerSync +quitall! 2>&1 >/dev/null)
res=$?; if [ $res -ne 0 ]; then
  printf "  -> failed: $errmsg\n"
  exit $res
fi

######################################################################
# Install LSP servers
######################################################################

printf "Installing LSP servers...\n"

printf "(1/5) installing rust LSP: rust-src\n"

out=$(rustup component add rust-src 2>&1 >/dev/null)
res=$?; if [ $res -ne 0 ]; then
  printf "  -> failed: $out"
  exit $res
fi

printf "(2/5) installing rust LSP: nightly/rust-analyzer-preview\n"

out=$(rustup +nightly component add rust-analyzer-preview 2>&1 >/dev/null)
res=$?; if [ $res -ne 0 ]; then
  printf "  -> failed: $out"
  exit $res
fi

printf "(3/5) installing golang LSP: golang.org/x/tools/gopls@latest\n"

out=$(go install golang.org/x/tools/gopls@latest 2>&1 >/dev/null)
res=$?; if [ $res -ne 0 ]; then
  printf "  -> failed: $out"
  exit $res
fi
  
printf "(4/5) installing python LSP: pyright\n"

out=$(yarn global add pyright 2>&1 >/dev/null)
res=$?; if [ $res -ne 0 ]; then
  printf "  -> failed: $out"
  exit $res
fi

printf "(5/5) installing typescript LSP: typescript-language-server\n"

out=$(yarn global add typescript-language-server 2>&1 >/dev/null)
res=$?; if [ $res -ne 0 ]; then
  printf "  -> failed: $out"
  exit $res
fi

