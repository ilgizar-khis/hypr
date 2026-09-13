hl.config({
	general = {
		gaps_in = 5,
		gaps_out = 10,

		border_size = 4,

		col = {
			active_border = "#ff6767",
			inactive_border = "#abcdef",
		},

		-- Set to true to enable resizing windows by clicking and dragging on borders and gaps
		resize_on_border = false,

		-- Please see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Tearing/ before you turn this on
		allow_tearing = false,
	},
})

hl.config({
	decoration = {
		rounding = 5,
		rounding_power = 2,

		-- Change transparency of focused and unfocused windows
		active_opacity = 1.0,
		inactive_opacity = 1.0,

		shadow = {
			enabled = true,
			range = 4,
			render_power = 3,
			color = "0xee1a1a1a",
		},

		blur = {
			enabled = true,
			size = 10,
			passes = 1,
			vibrancy = 0.1696,
		},
	},
})
