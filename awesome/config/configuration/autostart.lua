local awful = require("awful")
local filesystem = require("gears.filesystem")
local config_dir = filesystem.get_configuration_dir()
local helpers = require("helpers")

local function autostart_apps()
	--- Compositor
	helpers.run.check_if_running("picom --experimental-backends", nil, function()
		awful.spawn("picom --experimental-backends --config " .. config_dir .. "configuration/picom.conf", false)
	end)
	--- Music Server
	helpers.run.run_once_pgrep("mpd")
	helpers.run.run_once_pgrep("mpDris2")
	--- Polkit Agent
	helpers.run.run_once_ps(
		"polkit-gnome-authentication-agent-1",
		"/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1"
	)
	--- ibus daemon for hangul
	helpers.run.check_if_running("ibus-daemon -drx", nil, function()
		awful.spawn("ibus-daemon -drx", false)
	end)
	--- Other stuff
	helpers.run.run_once_grep("blueman-applet")
	helpers.run.run_once_grep("nm-applet")
end

autostart_apps()
