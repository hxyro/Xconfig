#!/usr/bin/env bash
killall -9 /usr/lib/xfce-polkit/xfce-polkit dunst

#sxhkd
pgrep -x sxhkd > /dev/null || sxhkd -c ~/.config/bspwm/sxhkd/sxhkdrc &

# Fix cursor
xsetroot -cursor_name left_ptr

#background
sh ~/.config/bspwm/scripts/wallpaper.sh &

#polybar
sh ~/.config/bspwm/bar/launch.sh &

#picom
picom --backend glx --glx-fshader-win "$(cat ~/.config/picom/grayscale.glsl)"

# polkit agent
/usr/lib/xfce-polkit/xfce-polkit &

#Notification Demon
dunst --config ~/.config/dunst/dunstrc &

# Network Manager Applet
nm-applet &

#Bluetoothd
#blueman-applet &

#Floating WM
#exec ~/.config/bspwm/scripts/floatingWM.sh
killall imwheel; sleep 0.1; imwheel &
