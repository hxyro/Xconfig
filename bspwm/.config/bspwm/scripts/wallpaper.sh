#!/bin/bash

# wall=$(ls ~/.config/bspwm/wallpaper/ | shuf -n 1)
feh --bg-fill --no-fehbg $(find ~/.config/bspwm/wallpaper/ | shuf -n 1)
#~/.fehbg
