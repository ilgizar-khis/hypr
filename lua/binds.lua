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

hl.bind(Super("C"), hl.dsp.window.close(), { desc = "Close window" })

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

hl.bind(
	"XF86AudioRaiseVolume",
	hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioLowerVolume",
	hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMicMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })

hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })
