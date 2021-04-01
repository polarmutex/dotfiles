local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi
local helpers = require('helpers')

-- Set colors
local active_color = {
    type = 'linear',
    from = {0, 0},
    to = {200, 50}, -- replace with w,h later
    stops = {{0, beautiful.xcolor4}, {0.75, beautiful.xcolor12}}
}

local background_color = beautiful.xbackground

local cpu = wibox.widget.textbox("")

awesome.connect_signal("watches::cpu", function(value)
    -- Use this if you want to display usage percentage
    cpu.markup = helpers.colorize_text(value .. "% ", beautiful.orange)
    -- Use this if you want to display idle percentage
    -- cpu_bar.value = tonumber(100 - value)
end)

return cpu
