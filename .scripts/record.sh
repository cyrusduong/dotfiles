#!/bin/sh
#
# record - record an area of the screen
dir=~/recordings
datenow=$(date +%F_%H-%M-%S)

mkdir -p "$dir"

coords=$(hacksaw --colour "#AA0000" --guide-thickness 2)
# Delay for compositor animations
sleep 0.5

file="$dir/$datenow.mp4"
echo "$coords" | {
	IFS=+x read -r w h x y

	w=$((w + w % 2))
	h=$((h + h % 2))

	ffmpeg \
		-loglevel error \
		-framerate 15 \
		-f x11grab \
		-s "${w}x${h}" \
		-i ":0.0+$x,$y" \
		-preset fast \
		-c:v h264 \
		-pix_fmt yuv420p \
		-crf 15 \
		-t 120 \
		"$file"
}

sleep 2
