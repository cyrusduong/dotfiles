#!/usr/bin/env bash

# Terminate already running bar instances
# If all your bars have ipc enabled, you can use
polybar-msg cmd quit
# Otherwise you can use the nuclear option:
# killall -q polybar

# Launch polybar
# echo "---" | tee -a /tmp/polybar.log
# polybar main 2>&1 | tee -a /tmp/polybar.log &
# disown

if type "xrandr"; then
	for m in $(xrandr --listmonitors | rg - | cut --delimiter=" " --fields=6); do
		MONITOR=$m polybar --reload main 2>&1 | tee -a "/tmp/polybar-$m" &
		sleep 0.05 # Added to always show systray items on primary bar when reloading
	done
else
	polybar --reload example &
fi
