#!/bin/sh
selection=$(hacksaw --colour "#FF0000" --guide-thickness 1)
sleep 0.25 # Delay capture for compositor animations
shotgun -g "$selection" - | tee $HOME/screengrabs/$(date '+%Y-%m-%d %H:%M:%S').png | xclip -t 'image/png' -selection clipboard &
