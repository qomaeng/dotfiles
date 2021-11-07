#!/bin/sh

declare -a plugins=(
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

printf ":: Installing asdf plugins...\n"

for name in ${plugins[@]}; do
  asdf plugin add $name 2>/dev/null
  res=$?

  if [ $res = 0 ]; then
    printf " installed: $name\n"
  elif [ $res = 2 ]; then
    printf " already installed: $name\n"
  else
    printf " -> failed to install: $name\n"
  fi
done

printf ":: Finished asdf plugins installing\n"

