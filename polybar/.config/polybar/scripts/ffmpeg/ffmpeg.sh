#!/bin/bash
ffmpeg -f x11grab -i :0.0 Videos/rec/"$(date +%l)-$(date +%M)$(date +%p)\\$(date +%e)-$(date +%m)\\$(date +%G)-$(date +%s)".mp4
