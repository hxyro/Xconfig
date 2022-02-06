#!/bin/bash
if pidof picom
then
    killall picom
    sleep 0.5
    if [ "$(cat ./toggle)" == "0" ]
    then
        echo -en "1" > ./toggle
        picom --invert-color-include "WM_CLASS@:s *?= 'Brave-browser'" 
    else
        echo -en "0" > ./toggle
        picom --experimental-backend 
    fi
else
    picom --experimental-backend 
fi

