#!/usr/bin/env bash

log_dir="$HOME/timesheets"
log_file="$log_dir/$(date '+%Y-%m-%d').log"

# Ensure the log_dir is created
if [ ! -d "$log_dir" ]; then
	mkdir -p "$log_dir"
fi

# Get the current time
unix=$(date +%s)
now=$(date '+%Y-%m-%d %H:%M:%S')

if [ "$1" = "start" ]; then
	echo "$unix start $now" >>"$log_file"
elif [ "$1" = "stop" ]; then
	echo "$unix stop $now" >>"$log_file"
else
	echo "Usage $0 [start|stop]"
	exit 1
fi
