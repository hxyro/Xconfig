#!/usr/bin/env bash
killall -9 /usr/lib/xfce-polkit/xfce-polkit dunst

#sxhkd
pgrep -x sxhkd > /dev/null || sxhkd -c ~/.config/bspwm/sxhkd/sxhkdrc &

# Fix cursor
xsetroot -cursor_name left_ptr

#background
feh --bg-scale --no-fehbg $(xdg-user-dir)/.config/wallpaper/xwall/cyberpunk.jpg  
#feh --bg-scale --no-fehbg --random $(xdg-user-dir)/.config/wallpaper/xwall/  #xwall
#feh --bg-scale --no-fehbg --random $(xdg-user-dir)/.config/wallpaper/dark    #dark

#polybar
sh $(xdg-user-dir)/.config/polybar/launch.sh &

#picom
picom -f --experimental-backend &

# polkit agent
/usr/lib/xfce-polkit/xfce-polkit &

#Notification Demon
dunst --config $(xdg-user-dir)/.config/dunst/dunstrc &

# Network Manager Applet
nm-applet &

#Bluetoothd
blueman-applet &
