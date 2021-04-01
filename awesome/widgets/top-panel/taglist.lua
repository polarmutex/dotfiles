local awful = require("awful")
local gears = require("gears")
local gfs = gears.filesystem
local wibox = require("wibox")
local beautiful = require("beautiful")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi
local helpers = require('helpers')

local get_taglist = function(s)

    -- Taglist buttons
    local taglist_buttons = gears.table.join(
        awful.button({}, 1, function(t) t:view_only() end),
        awful.button({modkey}, 1,
            function(t)
                if client.focus then client.focus:move_to_tag(t) end
            end),
        awful.button({}, 3, awful.tag.viewtoggle),
        awful.button({modkey}, 3, function(t)
            if client.focus then client.focus:toggle_tag(t) end
        end),
        awful.button({}, 4, function(t)
            awful.tag.viewnext(t.screen)
        end),
        awful.button({}, 5, function(t)
            awful.tag.viewprev(t.screen)
        end)
    )

    -- Function to update the tags
    local update_tags = function(self, c3)
        local textbox = self:get_children_by_id('icon_role')[1]
        if c3.selected then
            textbox.markup = helpers.colorize_text("", beautiful.yellow)
        elseif #c3:clients() == 0 then
            textbox.markup = helpers.colorize_text("", beautiful.fg0)
        else
            textbox.markup = helpers.colorize_text("", beautiful.aqua)
        end
    end

    local taglist = awful.widget.taglist {
        screen = s,
        filter = awful.widget.taglist.filter.all,
        style = {shape = gears.shape.rectangle},
        layout = {spacing = 0, layout = wibox.layout.fixed.horizontal},
        widget_template = {
            {
                {
                    id = 'icon_role',
                    font = beautiful.font_taglist,
                    widget = wibox.widget.textbox
                },
                id = 'margin_role',
                top = dpi(7),
                bottom = dpi(7),
                left = dpi(10),
                right = dpi(10),
                widget = wibox.container.margin
            },
            id = 'background_role',
            widget = wibox.container.background,
            create_callback = function(self, c3, index, objects)
                update_tags(self, c3)
                self:connect_signal('mouse::enter', function()
                    if self.bg ~= beautiful.xbackground  then
                        self.backup = self.bg
                        self.has_backup = true
                    end
                    self.bg = beautiful.xbackground
                end)
                self:connect_signal('mouse::leave', function()
                    if self.has_backup then
                        self.bg = self.backup
                    end
                end)
            end,
            update_callback = function(self, c3, index, objects)
                update_tags(self, c3)
            end
        },
        buttons = taglist_buttons
    }

    return taglist
end

return get_taglist

