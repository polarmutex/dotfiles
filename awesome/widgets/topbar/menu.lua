local beautiful = require("beautiful")
local awful = require("awful")
local hotkeys_popup = require("awful.hotkeys_popup")
local wibarutil = require("utils.wibar")
local wibox = require("wibox")

local apps = require("config.apps")

-- Create a launcher widget and a main menu
local myawesomemenu = {
  { "hotkeys", function() return false, hotkeys_popup.show_help end},
  { "manual", apps.terminal .. " -e man awesome" },
  --{ "edit config", editor_cmd .. " " .. awesome.conffile },
  { "restart", awesome.restart },
  { "quit", function() awesome.quit() end},
  { "open terminal", apps.terminal },
  { "lock", function() awesome.spawn("physlock -s") end },
  { "reboot", function() awesome.spawn("systemctl reboot") end },
  { "shutdown", function() awesome.spawn("systemctl poweroff") end },
}

local mymainmenu = awful.menu({ items = { { "awesome", myawesomemenu, beautiful.awesome_icon },
                                    { "open terminal", terminal }
                                  }
                        })


local mylauncher = wibarutil.create_parallelogram(
  {
    awful.widget.launcher {
      image = beautiful.awesome_icon,
      menu  = mymainmenu
    },
    spacing = beautiful.gap,
    layout  = wibox.layout.fixed.horizontal,
  },
  wibarutil.leftmost_parallelogram,
  beautiful.lightaqua, beautiful.small_gap)

return mylauncher
