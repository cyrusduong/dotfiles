#!/usr/bin/env sh

# Terminate existing instances
polybar-msg cmd quit
#killall -q polybar

# Wait until the ps have been stopped
while pgrep -x polybar >/dev/null; do sleep 1; done

# Start polybar
polybar 2>&1 | tee -a /tmp/polybar.log & disown 
