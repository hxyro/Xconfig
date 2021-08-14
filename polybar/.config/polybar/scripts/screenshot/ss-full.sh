#!/bin/zsh
maim | tee $(xdg-user-dir)/Pictures/screenshot/full/$(date +%s).png | xclip -selection clipboard -t image/png
