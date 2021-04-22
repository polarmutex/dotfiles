local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi
local helpers = require('helpers')

local ram = wibox.widget.textbox("")

awesome.connect_signal("watches::battery", function(value)

    local bat_icon = ' '
    local bat_color = beautiful.green

    if value >= 90 and value <= 100 then
        bat_icon = ' '
    elseif value >= 70 and value < 90 then
        bat_icon = ' '
    elseif value >= 60 and value < 70 then
        bat_icon = ' '
    elseif value >= 50 and value < 60 then
        bat_icon = ' '
        bat_color = beautiful.yellow
    elseif value >= 30 and value < 50 then
        bat_icon = ' '
        bat_color = beautiful.red
    elseif value >= 15 and value < 30 then
        bat_icon = ' '
    else
        bat_icon = ' '
    end

    if value < 50 then
        bat_icon = bat_icon .. " " .. value
    end

    ram.markup = helpers.colorize_text(
        " " .. bat_icon .. " ",
        bat_color
    )
end)

return ram
