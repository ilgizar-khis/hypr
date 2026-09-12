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

hl.bind(Super("Return"), hl.dsp.exec_cmd(terminal))

hl.bind(Super("C"), hl.dsp.window.close())

hl.bind(
	Super("M"),
	hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'")
)
hl.bind(Super("E"), hl.dsp.exec_cmd(fileManager))
hl.bind(Super("V"), hl.dsp.window.float({ action = "toggle" }))
hl.bind(Super("D"), hl.dsp.exec_cmd(menu))
hl.bind(Super("P"), hl.dsp.window.pseudo())
hl.bind(Super("J"), hl.dsp.layout("togglesplit")) -- dwindle only

hl.bind(Super("left"), hl.dsp.focus({ direction = "left" }))
hl.bind(Super("right"), hl.dsp.focus({ direction = "right" }))
hl.bind(Super("up"), hl.dsp.focus({ direction = "up" }))
hl.bind(Super("down"), hl.dsp.focus({ direction = "down" }))

for i = 1, 10 do
	local key = i % 10 -- 10 maps to key 0
	hl.bind(Super(key), hl.dsp.focus({ workspace = i }))
	hl.bind(Super(Shift(key)), hl.dsp.window.move({ workspace = i }))
end

hl.bind(Super("S"), hl.dsp.workspace.toggle_special("magic"))
hl.bind(Super(Shift("S")), hl.dsp.window.move({ workspace = "special:magic" }))

hl.bind(Super("mouse_down"), hl.dsp.focus({ workspace = "e+1" }))
hl.bind(Super("mouse_up"), hl.dsp.focus({ workspace = "e-1" }))

hl.bind(Super("mouse:272"), hl.dsp.window.drag(), { mouse = true })
hl.bind(Super("mouse:273"), hl.dsp.window.resize(), { mouse = true })

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
