#!/usr/bin/bash

if [[ "$#" == 1 ]]; then
	dir="$(xdg-user-dir PICTURES)/Screenshots"
	file="$(date +'%d_%B_%Y_%H_%M_%S').png"
	if [ ! -d "$dir" ]; then
		mkdir -p "$dir"
	fi

	grim -g "$1" "$dir/$file"

	result="$(notify-send "$file" -i "$dir/$file" -t 2000 -a "Screenshot" -A "default=default")"

	while [[ "$result" == "default" ]]; do
		satty --filename "$dir/$file" --output-filename "$dir/$file"
		result="$(notify-send "$file" -i "$dir/$file" -t 2000 -a "Screenshot" -A "default=default")"
	done
fi
