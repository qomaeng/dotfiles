#!/usr/bin/env bash

set -o nounset

BASEDIR=$(dirname "$0")

echo "Linking zsh environments..."

out=$(ln -srf "$BASEDIR/zsh/.zshenv" "$HOME/.zshenv" 2>&1)
res=$?; if [ $res -ne 0 ]; then
  echo "  -> failed: $out"
  exit $res
fi
  
out=$(ln -srf "$BASEDIR/zsh/config" "$HOME/.config/zsh" 2>&1)
res=$?; if [ $res -ne 0 ]; then
  echo "  -> failed: $out"
  exit $res
fi
  
