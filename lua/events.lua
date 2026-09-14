local terminal = "kitty"
local swaybg = "swaybg"
local waybar = "waybar"
local disk = "udiskie"

hl.on("hyprland.start", function()
	hl.exec_cmd(terminal)
	hl.exec_cmd(waybar)
	hl.exec_cmd(disk)
	hl.exec_cmd(swaybg .. " -o HDMI-A-1 -i /home/razigli/Pictures/backgrounds/HDMI-A-1.jpg")
	hl.exec_cmd(swaybg .. " -o eDP-1 -i /home/razigli/Pictures/backgrounds/eDP-1.jpg")
end)
