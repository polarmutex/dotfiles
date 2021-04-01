local awful = require('awful')
local beautiful = require('beautiful')
local wibox = require('wibox')
local gears = require('gears')
local helpers = require('helpers')
local beautiful = require("beautiful")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local configuration = require('configuration.config')
require('widgets.top-panel')

local mylauncher = require('widgets.top-panel.launcher')

local TopPanel = function(s)

    -- Wiboxes are much more flexible than wibars simply for the fact that there
    -- are no defaults, however if you'd rather have the ease of a wibar you can
    -- replace this with the original wibar code
    local panel =
        wibox({
            ontop = true,
            screen = s,
            height = configuration.toppanel_height,
            width = s.geometry.width,
            x = s.geometry.x,
            y = s.geometry.y,
            stretch = false,
            bg = beautiful.background,
            fg = beautiful.fg_normal,
            struts = {
                top = configuration.toppanel_height
            }
        })

    panel:struts({
        top = configuration.toppanel_height
    })

    s.mytaglist = require("widgets.top-panel.taglist")(s)
    s.mypromptbox = require("widgets.top-panel.promptbox")(s)
    s.mytasklist = require("widgets.top-panel.tasklist")(s)

    panel:setup {
        layout = wibox.layout.fixed.vertical,
        {
            widget = wibox.container.background,
            bg = beautiful.xcolor0,
            --forced_height = beautiful.widget_border_width
        },
        {
            layout = wibox.layout.align.horizontal,
            expand = "none",
            {
                layout = wibox.layout.fixed.horizontal,
                {
                    {
                        {
                            mylauncher,
                            s.mytaglist,
                            layout = wibox.layout.fixed.horizontal
                        },
                        bg = beautiful.xcolor0,
                        shape = helpers.rrect(beautiful.border_radius - 3),
                        widget = wibox.container.background
                    },
                    right = dpi(5),
                    left = dpi(10),
                    widget = wibox.container.margin
                },
                s.mypromptbox,
                {
                    --playerctl_bar,
                    margins = dpi(5),
                    widget = wibox.container.margin
                }
            },
            {
                nil,
                {
                    {
                        s.mytasklist,
                        bg = beautiful.xcolor0,
                        shape = helpers.rrect(beautiful.border_radius - 3),
                        widget = wibox.container.background
                    },
                    --margins = dpi(5),
                    widget = wibox.container.margin
                },
                nil,
                widget = wibox.container.constraint
            },
            {
                {
                    wibox.widget.systray(),
                    widget = wibox.container.margin
                },
                mytextclock,
                {
                    {
                        {
                            s.mylayoutbox,
                            right = dpi(7),
                            left = dpi(7),
                            widget = wibox.container.margin
                        },
                        bg = beautiful.xcolor0,
                        shape = helpers.rrect(beautiful.border_radius - 3),
                        widget = wibox.container.background
                    },
                    widget = wibox.container.margin
                },

                layout = wibox.layout.fixed.horizontal
            }
        }

    }

    return panel

end

return TopPanel

