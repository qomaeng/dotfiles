#!/usr/bin/env bash

set -o nounset

BASEDIR=$(dirname "$0")

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

for (( i=0; i<${#plugins[@]}; i++ )); do
  plugin_name=${plugins[$i]}
  echo "($((i+1))/${#plugins[@]}) installing asdf plugin: $plugin_name"
  
  errmsg=$(asdf plugin add "$plugin_name" 2>&1)
  res=$?; if [ $res -ne 0 ] && [ $res -ne 2 ]; then
    echo "  -> failed: $errmsg"
    exit $res
  fi
done

######################################################################
# Link .tool-versions
######################################################################

echo "Linking \"$HOME/.tool-versions\" -> \"$BASEDIR/asdf/.tool-versions\""

errmsg=$(ln -srf "$BASEDIR/asdf/.tool-versions" -t "$HOME" 2>&1)
res=$?; if [ $res -ne 0 ]; then
  echo "  -> failed: $errmsg"
  exit $res
fi


######################################################################
# Install packages using asdf
######################################################################

printf "Installing packages using asdf...\n"

for (( i=0; i<${#plugins[@]}; i++ )); do
  plugin_name=${plugins[$i]}
  echo "($((i+1))/${#plugins[@]}) installing package using asdf: $plugin_name"
  
  errmsg=$(asdf install "$plugin_name" 2>&1)
  res=$?; if [ $res -ne 0 ]; then
    echo "  -> failed: $errmsg"
    exit $res
  fi
done

