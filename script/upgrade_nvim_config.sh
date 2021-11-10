#!/bin/sh

if cd "$HOME/.config/nvim"; then
  git pull --rebase
else
  git clone \
    --depth 1 \
    --branch "main" \
    "git@github.com:qomaeng/NvChad.git" \
    "$HOME/.config/nvim" 
fi

nvim +PackerSync

