#!/bin/sh

if cd "$HOME/.asdf"; then
  git pull --rebase
else
  git clone \
    --depth 1 \
    --branch "v0.8.1" \
    "https://github.com/asdf-vm/asdf.git" \
    "$HOME/.asdf"
fi

