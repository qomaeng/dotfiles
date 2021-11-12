#!/bin/sh

BASEDIR=$(dirname "$0")

source "$BASEDIR/../utils/git.sh"

printf ":: Installing asdf...\n"

######################################################################
# Git sync asdf
######################################################################

git_sync \
  "$HOME/.asdf" \
  "https://github.com/asdf-vm/asdf.git" \
  "v0.8.1"

res=$?; [ $res -ne 0 ] && exit $res

######################################################################
# Add asdf plugins
######################################################################

plugins=(
  awscli
  golang
  k9s
  kubectl
  nodejs
  python
  rust
  terraform
  yarn
)

printf "Installing asdf plugins...\n"

plugins_len=${#plugins[@]}
for (( i=0; i<$plugins_len; i++ )); do
  plugin_name=${plugins[${i}]}
  printf "($((i+1))/$plugins_len) installing asdf plugin: $plugin_name\n"
  
  out=$(asdf plugin add "$plugin_name" 2>/dev/null)
  res=$?; if [ $res -ne 0 ] && [ $res -ne 2 ]; then
    printf "  -> failed to install\n"
    exit $res
  fi
done

######################################################################
# Link .tool-versions
######################################################################

printf "Linking \"$HOME/.tool-versions\" -> \"$BASEDIR/.tool-versions\"\n"

errmsg=$(ln -srf "$BASEDIR/.tool-versions" -t "$HOME" 2>&1 >/dev/null)
res=$?; if [ $? -ne 0 ]; then
  printf "  -> failed: $errmsg\n"
  exit $res
fi


######################################################################
# Install packages using asdf
######################################################################

printf "Installing packages using asdf...\n"

plugins_len=${#plugins[@]}
for (( i=0; i<$plugins_len; i++ )); do
  plugin_name=${plugins[${i}]}
  printf "($((i+1))/$plugins_len) installing package using asdf: $plugin_name\n"
  
  out=$(asdf install "$plugin_name" 2>/dev/null)
  res=$?; if [ $res -ne 0 ]; then
    printf "  -> failed to install\n"
    exit $res
  fi
done

