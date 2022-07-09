#!/usr/bin/env /bin/bash

BASEDIR=$(dirname "$0")

printf ":: Installing xorg...\n"

######################################################################
# Link .xinitrc
######################################################################

while read file
do 
  printf "Linking \"$HOME/$file\" -> \"$BASEDIR/$file\"\n"
  
  errmsg=$(ln -srf "$BASEDIR/$file" -t "$HOME/" 2>&1 >/dev/null)
  res=$?; if [ $res -ne 0 ]; then
    printf "  -> failed: $errmsg\n"
    exit $res
  fi
done <<-EOF
.xinitrc
.xserverrc
.Xresources
.Xresources.d
.Xmodmap
EOF

