#!/usr/bin/env bash

killall -q polybar
sleep 0.25

if type "xrandr"; then
	for m in $(xrandr --listmonitors | awk '{print $4}'); do
		MONITOR=$m polybar --reload main 2>&1 | tee -a "/tmp/polybar-$m" &
		sleep 0.1 # Added to always show systray items on primary bar when reloading
	done
else
	polybar --reload example &
fi
