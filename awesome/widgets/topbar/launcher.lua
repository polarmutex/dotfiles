local awful = require("awful")
local beautiful = require("beautiful")

local apps = require("config.apps")

--local launcher = button.create_text(beautiful.fg_dark, beautiful.fg_focus, "", "Fira Mono 16", function()
--    awful.spawn(apps.launcher, false)
--end)
local mylauncher = awful.widget.launcher({ image = beautiful.awesome_icon })

return mylauncher
