#!/usr/bin/env bash

# Kill all polybar and associated scripts
killall --quiet --signal TERM -- polybar
killall --quiet -- hackspeed.sh
killall --quiet -- scroll_spotify_status.sh
killall --quiet -- zscroll

# Roughly how long it takes to close
sleep 2
# Wait for them to close out (it will still hang for some reason...)
# while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done
# Kill any stuck polybars
killall --quiet --signal KILL -- polybar

if type "xrandr"; then
	# dunstify "xrandr"
	for m in $(xrandr --listmonitors | awk '{print $4}'); do
		# dunstify "initializing $m"
		MONITOR=$m polybar --reload main 2>&1 | tee -a "/tmp/polybar-$m" &
	done
else
	polybar --reload example &
fi
