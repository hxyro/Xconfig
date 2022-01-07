#!/bin/bash


if pidof ffmpeg
then
  killall ffmpeg
  notify-send 'Stopped Recording!' --icon=dialog-information
else 
  dir=$HOME/Videos/recs
  current=$(date +%F_%H-%M-%S)
  mkdir -p "$dir"

  slop=$(slop -f "%x %y %w %h")
  read -r x y w h < <(echo $slop)

  width=${#w} 
  [ "$(expr ${w} % 2)" == 0 ] || w=$(expr ${w} + 1)
  [ "$(expr ${h} % 2)" == 0 ] || h=$(expr ${h} + 1)

  if [ $width -gt 0 ];
  then
    notify-send 'Started Recording!' --icon=dialog-information

    ffmpeg               \
      -v 16            \
      -r 60            \
      -f x11grab       \
      -s "${w}x${h}"   \
      -i ":0.0+$x,$y"  \
      -preset slow     \
      -c:v h264        \
      -pix_fmt yuv420p \
      -crf 20          \
      "$dir/$current.mp4" 
    notify-send 'File saved in $HOME/Videos/recs' --icon=dialog-information
  fi
  dragon-drag-and-drop -x $dir/$current.mp4
fi

