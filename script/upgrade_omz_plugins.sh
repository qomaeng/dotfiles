#!/bin/sh

# zsh-autosuggestions
if cd "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions"; then
  git pull --rebase
else
  git clone \
    --depth 1 \
    --branch "master" \
    "https://github.com/zsh-users/zsh-autosuggestions.git" \
    "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions"
fi

