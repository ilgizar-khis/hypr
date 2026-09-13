#!/usr/bin/bash

if [[ "$#" == 1 ]]; then
	geometry=""
	dir="$(xdg-user-dir PICTURES)/Screenshots"
	file="$(date +'%d_%B_%Y_%H_%M_%S').png"
	if [ ! -d "$dir" ]; then
		mkdir -p "$dir"
	fi

	if [[ "$1" == "region" ]]; then
		geometry="$(slurp)"
	elif [[ "$1" == "client" ]]; then
		bs1="$(hyprctl repl 'hl.get_config("general.border_size")')"
		bs2=$((bs * 2))
		geometry="$(hyprctl activewindow -j | jq -r '"\(.at.[0] - '$bs1'),\(.at.[1] - '$bs1') \(.size.[0] + '$bs2')x\(.size.[1] + '$bs2')"')"
	else
		geometry="$(slurp -o)"
	fi

	grim -g "$geometry" "$dir/$file"

	result="$(notify-send "$file" -i "$dir/$file" -t 2000 -a "Screenshot" -A "default=default")"

	while [[ "$result" == "default" ]]; do
		satty --filename "$dir/$file" --output-filename "$dir/$file"
		result="$(notify-send "$file" -i "$dir/$file" -t 2000 -a "Screenshot" -A "default=default")"
	done
fi
