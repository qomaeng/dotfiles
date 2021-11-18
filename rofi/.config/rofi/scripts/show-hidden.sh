#!/bin/sh

DPI=$(xrdb -get Xft.dpi)

selected=$(
  for id in $(bspc query -N -n .hidden); do
    title=$(xtitle $id)
    [ -z "$title" ] && title="<unnamed>"
    echo $id $title
  done \
    | rofi -dpi ${DPI:-96} -dmenu -i -p 'Hidden' \
    | cut -f1 -d ' '
)

[ -z "$selected" ] && exit 1
 
bspc node "$selected" --flag hidden=off && \
  bspc node -f "$selected"

