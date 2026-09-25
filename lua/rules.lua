hl.window_rule({
	name = "nwg-look",
	match = { class = "nwg-look" },
	float = true,
})

hl.window_rule({
	name = "special-workspace",
	match = {
		workspace = "special:magic",
	},
	border_color = "#ffaa00",
})

hl.window_rule({
	-- Ignore maximize requests from all apps. You'll probably like this.
	name = "suppress-maximize-events",
	match = { class = ".*" },

	suppress_event = "maximize",
})

hl.window_rule({
	name = "fix-xwayland-drags",
	match = {
		class = "^$",
		title = "^$",
		xwayland = true,
		float = true,
		fullscreen = false,
		pin = false,
	},

	no_focus = true,
})

hl.window_rule({
	name = "move-hyprland-run",
	match = { class = "hyprland-run" },

	move = "20 monitor_h-120",
	float = true,
})

hl.layer_rule({
	name = "rofi-blur",
	match = { namespace = "rofi" },
	blur = true,
})

for i = 1, 9 do
	hl.workspace_rule({ workspace = tostring(i), monitor = "HDMI-A-1" })
end

hl.workspace_rule({ workspace = "10", monitor = "eDP-1" })
