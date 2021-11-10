#!/bin/sh

if cd "$HOME/.zsh/pure"; then
  git pull --rebase
else
  git clone \
    --depth 1 \
    --branch "main" \
    "https://github.com/sindresorhus/pure.git" \
    "$HOME/.zsh/pure" 
fi

