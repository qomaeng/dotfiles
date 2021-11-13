#!/bin/sh

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
# Install oh-my-zsh
######################################################################

printf "Installing oh-my-zsh...\n"

if [ ! command -v omz ]; then
  printf "(1/2) retrieving oh-my-zsh install script\n"
  
  install_script="$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh 2>/dev/null)"
  res=$?; if [ $res -ne 0 ]; then
    errmsg="$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh 2>&1 >/dev/null)"
    
    printf "  -> failed: $errmsg\n"
    exit $res
  fi
  
  printf "(2/2) running oh-my-zsh install script\n"
  
  errmsg="$(sh -c \"$install_script\" 2>&1 >/dev/null)"
  res=$?; if [ $res -ne 0 ]; then
    printf "  -> failed: $errmsg\n"
    exit $res
  fi
fi

######################################################################
# Git sync zsh-autosuggestions
######################################################################

git_sync \
  "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions" \
  "https://github.com/zsh-users/zsh-autosuggestions.git" \
  "master"

res=$?; [ $res -ne 0 ] && exit $res

######################################################################
# Link .zshrc
######################################################################

printf "Linking \"$HOME/.zshrc\" -> \"$BASEDIR/.zshrc\"\n"

errmsg=$(ln -srf "$BASEDIR/.zshrc" -t "$HOME" 2>&1 >/dev/null)
res=$?; if [ $res -ne 0 ]; then
  printf "  -> failed: $errmsg\n"
  exit res
fi

