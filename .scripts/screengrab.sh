#!/bin/sh
selection=$(hacksaw --colour "#AA0000" --guide-thickness 2)
now=$(date '+%Y-%m-%d_%H-%M-%S')
file_name="$now.png"
file_dir="$HOME/screengrabs"
file_path="$file_dir/$file_name"
sleep 0.25 # Delay capture for compositor animations
shotgun -g "$selection" - >"$file_path"
sleep 0.25 # Give time to write

# manually add the entry to copyq in-case I need it later
cb copy "$file_path"
dunstify "Copied $file_name to clipboard"
