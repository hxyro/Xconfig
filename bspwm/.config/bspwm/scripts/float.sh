#!/bin/bash

FLOATING_DESKTOP_ID1=$(bspc query -D -d '^3')
bspc subscribe node_add | while read -a msg ; do
desk_id=${msg[2]}
wid=${msg[4]}
[ "$FLOATING_DESKTOP_ID1" = "$desk_id" ] && bspc node "$wid" -t floating
done
