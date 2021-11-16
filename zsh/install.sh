#!/usr/bin/env sh

BASEDIR=$(dirname "$0")

source "$BASEDIR/../utils/git.sh"

printf ":: Installing zsh pure theme...\n"

######################################################################
# Git sync pure theme
######################################################################

git_sync \
  "$HOME/.zsh/pure" \
  "https://github.com/sindresorhus/pure.git" \
  "main"

res=$?; [ $res -ne 0 ] && exit $res

######################################################################
# Git sync zsh-autosuggestions
######################################################################

git_sync \
  "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions" \
  "https://github.com/zsh-users/zsh-autosuggestions.git" \
  "master"

res=$?; [ $res -ne 0 ] && exit $res

######################################################################
# Git sync zsh-completions
######################################################################

git_sync \
  "$HOME/.oh-my-zsh/custom/plugins/zsh-completions" \
  "https://github.com/zsh-users/zsh-completions.git" \
  "master"

res=$?; [ $res -ne 0 ] && exit $res

######################################################################
# Link .zshrc
######################################################################

printf "Linking \"$HOME/.zshrc\" -> \"$BASEDIR/.zshrc\"\n"

errmsg=$(ln -srf "$BASEDIR/.zshrc" -t "$HOME" 2>&1 >/dev/null)
res=$?; if [ $res -ne 0 ]; then
  printf "  -> failed: $errmsg\n"
  exit $res
fi

source "$HOME/.zshrc"
res=$?; if [ $res -ne 0 ]; then
  printf "  -> Error occured while sourcing script\n"
  exit $res
fi

