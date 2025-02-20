#!/usr/bin/env bash

set -o nounset

BASEDIR=$(dirname "${BASH_SOURCE[0]}")

echo "Linking zsh environments..."

out=$(ln -srnf "$BASEDIR/zsh/.zshenv" "$HOME/.zshenv" 2>&1)
res=$?; if [ $res -ne 0 ]; then
  echo "  -> failed: $out"
  exit $res
fi
  
out=$(ln -srnf "$BASEDIR/zsh/config" "$HOME/.config/zsh" 2>&1)
res=$?; if [ $res -ne 0 ]; then
  echo "  -> failed: $out"
  exit $res
fi
  
