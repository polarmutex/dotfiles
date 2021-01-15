-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
local beautiful = require("beautiful")
local dpi = require("beautiful.xresources").apply_dpi

-- Wibox handling library
local wibox = require("wibox")

-- Custom Local Library: Common Functional Decoration
local deco = {
  wallpaper = require("deco.wallpaper"),
  taglist   = require("deco.taglist"),
  tasklist  = require("deco.tasklist")
}

local taglist_buttons  = deco.taglist()
local tasklist_buttons = deco.tasklist()

local M = {}

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

-- Wibar
-- Create a textclock widget
mytextclock = wibox.widget.textclock(" %a %b %d, %l:%M%P", 15)

local taglist_widget_template = {
    {
        {
            id     = 'text_role',
            widget = wibox.widget.textbox,
        },
        left  = beautiful.big_gap,
        right = beautiful.big_gap,
        widget = wibox.container.margin
    },
    id     = 'background_role',
    widget = wibox.container.background,
    -- Add support for hover colors
    create_callback = function(self, c3, index, objects) --luacheck: no unused args
        self:connect_signal('mouse::enter', function()
            if not c3.selected then
                if self.bg ~= beautiful.bg2 then
                    self.backup     = self.bg
                    self.has_backup = true
                end
                self.bg = beautiful.bg2
            end
        end)
        self:connect_signal('mouse::leave', function()
            if self.has_backup and not c3.selected then
                self.bg = self.backup
            end
        end)
    end,
}

awful.screen.connect_for_each_screen(function(s)
  -- Wallpaper
  set_wallpaper(s)

  -- Create a promptbox for each screen
  s.mypromptbox = awful.widget.prompt()

  -- Create an imagebox widget which will contain an icon indicating which layout we're using.
  -- We need one layoutbox per screen.
  s.mylayoutbox = awful.widget.layoutbox(s)
  s.mylayoutbox:buttons(gears.table.join(
    awful.button({ }, 1, function () awful.layout.inc( 1) end),
    awful.button({ }, 3, function () awful.layout.inc(-1) end),
    awful.button({ }, 4, function () awful.layout.inc( 1) end),
    awful.button({ }, 5, function () awful.layout.inc(-1) end)
  ))

  -- Create a taglist widget
  s.mytaglist = awful.widget.taglist {
    screen  = s,
    filter  = awful.widget.taglist.filter.all,
    style   = {
        shape = function(cr, width, height, degree)
            degree = degree or 10
            cr:move_to(0, 0)
            cr:line_to(width - degree, 0)
            cr:line_to(width, height)
            cr:line_to(degree, height)
            cr:close_path()
        end
    },
    layout  = {
        spacing = beautiful.negative_gap,
        layout  = wibox.layout.grid.horizontal
    },
    widget_template = taglist_widget_template,
    buttons = taglist_buttons
  }

  -- Create a tasklist widget
  s.mytasklist = awful.widget.tasklist {
    screen  = s,
    filter  = awful.widget.tasklist.filter.currenttags,
    buttons = tasklist_buttons
  }

  -- Create the wibox
  s.mywibox = awful.wibar({ position = "top", screen = s })

  -- Add widgets to the wibox
  s.mywibox:setup {
        layout = wibox.layout.align.horizontal,
        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            RC.launcher,
            s.mytaglist,
            s.mypromptbox,
        },
        { -- Middle widgets
            mytextclock,
            valign = "center",
            halign = "center",
            layout = wibox.container.place
        },
        { -- Right widgets
            layout = wibox.layout.fixed.horizontal,
            --mykeyboardlayout,
            wibox.widget.systray(),
            s.mylayoutbox,
        },
  }
end)
