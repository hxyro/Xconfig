#!/bin/bash

maim --select | tee $(xdg-user-dir)/Pictures/screenshot/selection/$(date +%s).png | xclip -selection clipboard -t image/png
