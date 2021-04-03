local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")
local helpers = require("helpers")
local beautiful = require("beautiful")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

-- Title Widget
local song_title = wibox.widget {
    markup = 'Nothing Playing',
    align = 'center',
    valign = 'center',
    widget = wibox.widget.textbox
}

local song_artist = wibox.widget {
    markup = 'nothing playing',
    align = 'center',
    valign = 'center',
    widget = wibox.widget.textbox
}

local song_logo = wibox.widget {
    markup = '<span foreground="' .. beautiful.xcolor6 .. '"></span>',
    font = beautiful.icon_font,
    align = 'center',
    valign = 'center',
    widget = wibox.widget.textbox
}

local playerctl_bar = wibox.widget {
    {
        {
            {
                song_logo,
                left = dpi(3),
                right = dpi(10),
                bottom = dpi(1),
                widget = wibox.container.margin
            },
            {
                {
                    song_title,
                    expand = "outside",
                    layout = wibox.layout.align.vertical
                },
                left = dpi(10),
                right = dpi(10),
                widget = wibox.container.margin
            },
            {
                {
                    song_artist,
                    expand = "outside",
                    layout = wibox.layout.align.vertical
                },
                left = dpi(10),
                widget = wibox.container.margin
            },
            spacing = 1,
            spacing_widget = {
                bg = beautiful.xcolor8,
                widget = wibox.container.background
            },
            layout = wibox.layout.fixed.horizontal
        },
        left = dpi(10),
        right = dpi(10),
        widget = wibox.container.margin
    },

    bg = beautiful.xcolor0,
    shape = helpers.rrect(beautiful.border_radius - 3),
    widget = wibox.container.background
}

playerctl_bar.visible = false

awesome.connect_signal("bling::playerctl::player_stopped",
function() playerctl_bar.visible = false end)

-- Get Title 
awesome.connect_signal("bling::playerctl::title_artist_album",
function(title, artist, _)

    playerctl_bar.visible = true
    song_title.markup = '<span foreground="' .. beautiful.xcolor5 .. '">' ..
    title .. '</span>'

    song_artist.markup = '<span foreground="' .. beautiful.xcolor4 .. '">' ..
    artist .. '</span>'
end)

return playerctl_bar
