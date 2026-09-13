local hypr = "$HOME/.config/hypr/"
local scrpits = "$HOME/.config/hypr/scripts/"

local function Super(key)
	return "SUPER + " .. key
end

local function Alt(key)
	return "ALT + " .. key
end

local function Ctrl(key)
	return "CTRL + " .. key
end

local function Shift(key)
	return "SHIFT + " .. key
end

local terminal = "kitty"
local fileManager = "thunar"
local menu = "rofi -show drun"

hl.bind(Super("Return"), hl.dsp.exec_cmd(terminal), { desc = "Launch terminal" })

hl.bind(Super(Shift("q")), hl.dsp.window.close(), { desc = "Close window" })

hl.bind(
	Super("M"),
	hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"),
	{ desc = "exit hyprland" }
)
hl.bind(Super("E"), hl.dsp.exec_cmd(fileManager), { desc = "Launch file manager" })
hl.bind(Super("V"), hl.dsp.window.float({ action = "toggle" }), { desc = "Toggle floating of window" })
hl.bind(Super("D"), hl.dsp.exec_cmd(menu), { desc = "Launch menu" })
hl.bind(Super("P"), hl.dsp.window.pseudo(), { desc = "toggle pseudotiling of window" })

local ARROWS = { left = "h", right = "l", up = "k", down = "j" }

for direction, key in pairs(ARROWS) do
	hl.bind(Super(key), hl.dsp.focus({ direction = direction }), { desc = "move focus to " .. direction .. " window" })
	hl.bind(
		Super(Shift(key)),
		hl.dsp.window.move({ direction = direction }),
		{ desc = "move window to " .. direction .. " direction" }
	)
end

for i = 1, 10 do
	local key = i % 10 -- 10 maps to key 0
	hl.bind(Super(key), hl.dsp.focus({ workspace = i }), { desc = "move focus to WS" .. i })
	hl.bind(Super(Shift(key)), hl.dsp.window.move({ workspace = i }), { desc = "move window to WS" .. i })
end

hl.bind(Super("S"), hl.dsp.workspace.toggle_special("magic"), { desc = "move focus to ws:magic" })
hl.bind(Super(Shift("S")), hl.dsp.window.move({ workspace = "special:magic" }), { desc = "move window to ws:magic" })

hl.bind(Super("mouse_down"), hl.dsp.focus({ workspace = "e+1" }))
hl.bind(Super("mouse_up"), hl.dsp.focus({ workspace = "e-1" }))

hl.bind(Super("mouse:272"), hl.dsp.window.drag(), { mouse = true, desc = "move window (mouse)" })
hl.bind(Super("mouse:273"), hl.dsp.window.resize(), { mouse = true, desc = "resize window (mouse)" })

local fn_repeating = {
	XF86AudioRaiseVolume = "wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+",
	XF86AudioLowerVolume = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-",
	XF86AudioMute = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle",
	XF86AudioMicMute = "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle",
	XF86MonBrightnessUp = "brightnessctl -e4 -n2 set 5%+",
	XF86MonBrightnessDown = "brightnessctl -e4 -n2 set 5%-",
}

for key, cmd in pairs(fn_repeating) do
	hl.bind(key, hl.dsp.exec_cmd(cmd), { locked = true, repeating = true })
end

local fn = {
	XF86AudioNext = "playerctl next",
	XF86AudioPause = "playerctl play-pause",
	XF86AudioPlay = "playerctl play-pause",
	XF86AudioPrev = "playerctl previous",
}

for key, cmd in pairs(fn) do
	hl.bind(key, hl.dsp.exec_cmd(cmd), { locked = true })
end

local screenshot = scrpits .. "/screenshot.sh"
hl.bind(Super("Print"), hl.dsp.exec_cmd(screenshot .. " output"))
hl.bind(Alt("Print"), hl.dsp.exec_cmd(screenshot .. " client"))
hl.bind(Ctrl("Print"), hl.dsp.exec_cmd(screenshot .. " region"))
