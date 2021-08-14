#!/bin/bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch Polybar, using default config location ~/.config/polybar/config
#polybar meow &
polybar cyberpunk-main0 -c ~/.config/polybar/cyberpunk/config.ini &
polybar cyberpunk-date -c ~/.config/polybar/cyberpunk/config.ini &
polybar cyberpunk-misk -c ~/.config/polybar/cyberpunk/config.ini &
