-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
local beautiful = require("beautiful")
local dpi = require("beautiful.xresources").apply_dpi
local lain  = require("lain")
local markup = lain.util.markup

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

-- TextClock
local clock = wibox.widget.textclock(" %a %b %d, %l:%M%P ", 15)

-- Calendar
local cal = lain.widget.cal({
    attach_to = { clock },
    notification_preset = {
        font = "Ubuntu Mono 12",
        fg   = beautiful.fg_normal,
        bg   = beautiful.bg_normal
    }
})

-- MEM
local memicon = wibox.widget.textbox(beautiful.widget_mem)
local mem = lain.widget.mem({
    settings = function()
        widget:set_markup(markup.font(beautiful.font, " " .. mem_now.used .. "MB "))
    end
})

-- CPU
local cpuicon = wibox.widget.textbox(beautiful.widget_cpu)
local cpu = lain.widget.cpu({
    settings = function()
        widget:set_markup(markup.font(beautiful.font, " " .. cpu_now.usage .. "% "))
    end
})

-- Temp
local tempicon = wibox.widget.textbox(beautiful.widget_temp)
local temp = lain.widget.temp({
    settings = function()
        widget:set_markup(markup.font(beautiful.font, " " .. coretemp_now .. "°C "))
    end
})

-- Battery
local baticon = wibox.widget.textbox(beautiful.widget_battery)
local bat = lain.widget.bat({
    settings = function()
        if bat_now.status and bat_now.status ~= "N/A " then
            if bat_now.ac_status == 1 then
                baticon:set_text(beautiful.widget_ac .. " ")
            elseif not bat_now.perc and tonumber(bat_now.perc) <= 5 then
                baticon:set_text(beautiful.widget_battery_empty .. " ")
            elseif not bat_now.perc and tonumber(bat_now.perc) <= 15 then
                baticon:set_text(beautiful.widget_battery_low .. " ")
            else
                baticon:set_text(beautiful.widget_battery .. " ")
            end
            widget:set_markup(markup.font(beautiful.font, " " .. bat_now.perc .. "% "))
        else
            widget:set_markup(markup.font(beautiful.font, " AC "))
            baticon:set_text(beautiful.widget_ac)
        end
    end
})
bat.widget:buttons(awful.util.table.join(
                               awful.button({}, 4, function ()
                                     awful.util.spawn("xbacklight -inc 5")
                                     bat.update()
                               end),
                               awful.button({}, 5, function ()
                                     awful.util.spawn("xbacklight -dec 5")
                                     bat.update()
                               end)
))

-- ALSA volume
local volicon = wibox.widget.textbox(beautiful.widget_vol .. " ")
local volume = lain.widget.alsa({
    settings = function()
        if volume_now.status == "off" then
            volicon:set_text(beautiful.widget_vol_mute .. " ")
        elseif tonumber(volume_now.level) == 0 then
            volicon:set_text(beautiful.widget_vol_no .. " ")
        elseif tonumber(volume_now.level) <= 50 then
            volicon:set_text(beautiful.widget_vol_low .. " ")
        else
            volicon:set_text(beautiful.widget_vol .. " ")
        end

        widget:set_markup(markup.font(beautiful.font, " " .. volume_now.level .. "% "))
    end
})
volume.widget:buttons(awful.util.table.join(
                               awful.button({}, 4, function ()
                                     awful.util.spawn("amixer set Master 1%+")
                                     volume.update()
                               end),
                               awful.button({}, 1, function ()
                                     awful.util.spawn("pavucontrol -t 3")
                               end),
                               awful.button({}, 3, function ()
                                     awful.util.spawn("pkill pavucontrol")
                               end),
                               awful.button({}, 5, function ()
                                     awful.util.spawn("amixer set Master 1%-")
                                     volume.update()
                               end)
))

-- Net
local neticon =  wibox.widget{
    markup = '   ',
    align  = 'center',
    valign = 'center',
    fg     = beautiful.fg_normal,
    widget = wibox.widget.textbox
}
neticon:buttons(awful.util.table.join(
                               awful.button({}, 1, function ()
                                     awful.spawn.with_shell("bash ~/.local/bin/scripts/rofi/rofi-wifi-menu/rofi-wifi-menu.sh")
                               end)
))

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
            --mytextclock,
            s.mytasklist,
            valign = "center",
            halign = "center",
            layout = wibox.container.place
        },
        { -- Right widgets
            layout = wibox.layout.fixed.horizontal,
            --mykeyboardlayout,
            wibox.widget.systray(),
            memicon,
            mem.widget,
            cpuicon,
            cpu.widget,
            tempicon,
            temp.widget,
            neticon,
            volicon,
            volume.widget,
            baticon,
            bat.widget,
            clock,
            s.mylayoutbox,
        },
  }
end)
