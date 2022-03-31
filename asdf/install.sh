#!/usr/bin/env /bin/bash

BASEDIR=$(dirname "$0")

. "$BASEDIR/../utils/git.sh"

printf ":: Installing asdf...\n"

######################################################################
# Git sync asdf
######################################################################

git_sync \
  "$HOME/.asdf" \
  "https://github.com/asdf-vm/asdf.git" \
  "v0.8.1"

res=$?; [ $res -ne 0 ] && exit $res

. "$HOME/.asdf/asdf.sh" && . "$HOME/.asdf/completions/asdf.bash"
res=$?; if [ $? -ne 0 ]; then
  printf "  -> error occured while sourcing script\n"
  exit $res
fi

######################################################################
# Add asdf plugins
######################################################################

plugins=(
  awscli
  golang
  java
  k9s
  kubectl
  maven
  nodejs
  python
  rust
  terraform
  yarn
)

printf "Installing asdf plugins...\n"

plugins_len=${#plugins[@]}
for (( i=0; i<$plugins_len; i++ )); do
  plugin_name=${plugins[$i]}
  printf "($((i+1))/$plugins_len) installing asdf plugin: $plugin_name\n"
  
  errmsg=$(asdf plugin add "$plugin_name" 2>&1 >/dev/null)
  res=$?; if [ $res -ne 0 ] && [ $res -ne 2 ]; then
    printf "  -> failed: $errmsg\n"
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
  plugin_name=${plugins[$i]}
  printf "($((i+1))/$plugins_len) installing package using asdf: $plugin_name\n"
  
  errmsg=$(asdf install "$plugin_name" 2>&1 >/dev/null)
  res=$?; if [ $res -ne 0 ]; then
    printf "  -> failed: $errmsg\n"
    exit $res
  fi
done

