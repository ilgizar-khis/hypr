local terminal = "kitty"
local swaybg = "swaybg"

hl.on("hyprland.start", function()
	hl.exec_cmd(terminal)
	hl.exec_cmd(swaybg .. " -o HDMI-A-1 -i /home/razigli/backgrounds/GunsmithCats.jpg")
	hl.exec_cmd(swaybg .. " -o eDP-1 -i /home/razigli/backgrounds/a24770.jpg")
end)
