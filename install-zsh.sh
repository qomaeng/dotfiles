#!/usr/bin/env /bin/bash

BASEDIR=$(dirname "$0")

. "$BASEDIR/utils/git.sh"

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

exit $res
