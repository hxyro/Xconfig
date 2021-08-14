#!/bin/bash

 FLOATING_DESKTOP_ID1=$(bspc query -D -d '^1')
 FLOATING_DESKTOP_ID2=$(bspc query -D -d '^2')
 FLOATING_DESKTOP_ID3=$(bspc query -D -d '^3')
 FLOATING_DESKTOP_ID4=$(bspc query -D -d '^4')
 FLOATING_DESKTOP_ID5=$(bspc query -D -d '^5')
 FLOATING_DESKTOP_ID6=$(bspc query -D -d '^6')
 FLOATING_DESKTOP_ID7=$(bspc query -D -d '^7')
 FLOATING_DESKTOP_ID8=$(bspc query -D -d '^8')

 bspc subscribe node_add | while read -a msg ; do
    desk_id=${msg[2]}
    wid=${msg[4]}
    [ "$FLOATING_DESKTOP_ID1" = "$desk_id" ] && bspc node "$wid" -t floating
    [ "$FLOATING_DESKTOP_ID2" = "$desk_id" ] && bspc node "$wid" -t floating
    [ "$FLOATING_DESKTOP_ID3" = "$desk_id" ] && bspc node "$wid" -t floating
    [ "$FLOATING_DESKTOP_ID4" = "$desk_id" ] && bspc node "$wid" -t floating
    [ "$FLOATING_DESKTOP_ID5" = "$desk_id" ] && bspc node "$wid" -t floating
    [ "$FLOATING_DESKTOP_ID6" = "$desk_id" ] && bspc node "$wid" -t floating
    [ "$FLOATING_DESKTOP_ID7" = "$desk_id" ] && bspc node "$wid" -t floating
    [ "$FLOATING_DESKTOP_ID8" = "$desk_id" ] && bspc node "$wid" -t floating
 done
