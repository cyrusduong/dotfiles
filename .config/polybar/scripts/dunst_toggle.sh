#!/usr/bin/env bash
# Toggle notifications
dunstctl set-paused toggle
dunstctl is-paused | rg true

PAUSED="$?"

# Notify polybar module via IPC of the notfications status
polybar-msg action dunst hook "$PAUSED" 1>/dev/null 2>&1
