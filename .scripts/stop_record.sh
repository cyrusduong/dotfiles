#!/usr/bin/env bash

killall ffmpeg

# Give time for file to write?
sleep 0.25

latest_file=$(ls -lr ~/recordings/ | rg cduong | head --lines 1 | awk '{print $9}')

full_path="$HOME/recordings/$latest_file"
echo $full_path

# We need to use https://github.com/Slackadays/Clipboard
# to copy the file. I don't know what magic sorcery they do to
# set the types needed to correctly "paste" into apps like Discord.
cb copy $full_path
dunstify "Copied $latest_file to clipboard"
