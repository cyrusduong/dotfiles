#!/bin/bash

timesheet_dir="$HOME/timesheets"
timesheet_file="$timesheet_dir/$(date '+%Y-%m-%d').log"

if [ ! -d "$timesheet_dir" ]; then
	echo "No $timesheet_dir found."
	exit 1
fi

if [ "$1" = "day" ]; then
	given_date=$2
	timesheet_file="$timesheet_dir/$given_date.log"

	if [ ! -f "$timesheet_file" ]; then
		echo "No log file found for $given_date."
		exit 1
	fi

	start_time=0
	stop_time=0
	total_duration=0
	now=$(date +%s)

	while read -r line; do
		timestamp=$(echo "$line" | cut --delimiter=" " -f1)
		action=$(echo "$line" | cut --delimiter=" " -f2)

		if [ "$action" = "start" ]; then
			start_time=$timestamp
		elif [ "$action" = "stop" ]; then
			stop_time=$timestamp
			duration=$((stop_time - start_time))
			total_duration=$((total_duration + duration))
		fi
	done <"$timesheet_file"

	duration_hours=$(awk "BEGIN {printf \"%.2f\", $total_duration / 3600}")
	echo "$given_date: $duration_hours hours ($total_duration seconds)"
elif [ "$1" = "since" ]; then
	# Calculate total duration from a specified date up to today
	specified_date=$2
	now=$(date '+%s')
	start_date=$(date -d "$specified_date" '+%s')
	current_date=$start_date

	while [ "$current_date" -le "$now" ]; do
		current_day=$(date -d "@$current_date" '+%Y-%m-%d')
		current_day_file="$timesheet_dir/$current_day.log"
		"$0" day "$current_day"
		current_date=$((current_date + 24 * 3600)) # Move to the next day
	done
elif [ "$1" = "yesterday" ]; then
	# Calculate yesterday's date
	end_date=$(date '+%s')
	start_date_unix=$(($end_date - 1 * 24 * 3600))            # 6 days ago (including today)
	start_date=$(date -d "@$((start_date_unix))" '+%Y-%m-%d') # Convert Unix timestamp to YYYY-MM-DD
	"$0" day "$start_date"
elif [ "$1" = "today" ]; then
	"$0" day $(date '+%Y-%m-%d')
elif [ "$1" = "week" ]; then
	# Calculate the total duration for the past 7 days (including today)
	end_date=$(date '+%s')
	start_date_unix=$(($end_date - 6 * 24 * 3600))            # 6 days ago (including today)
	start_date=$(date -d "@$((start_date_unix))" '+%Y-%m-%d') # Convert Unix timestamp to YYYY-MM-DD
	"$0" since "$start_date"
else
	echo "Usage: $0 [today|yesterday|week|day YYYY-MM-DD|since YYYY-MM-DD]"
	exit 1
fi
