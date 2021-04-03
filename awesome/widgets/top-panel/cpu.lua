local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi
local helpers = require('helpers')

local cpu = wibox.widget.textbox("")

--local popup = awful.popup{
--    ontop = true,
--    visable = false,
--    shape = gears.shape.rounded_rect,
--    border_width = 1,
--    --border_color = beautiful.bg_normal,
--    maximum_width = 300,
--    offset = { y = 5 },
--    widget = {}
--}

--cpu:buttons{
--    awful.util.table.join{
--        awful.button({}, 1, function()
            --if popup.visible then
            --    popup.visible = false
            --else
            --    popup:move_next_to(mouse.current_widget_geometry)
            --end
--        end)
--    }
--}

awesome.connect_signal("watches::cpu", function(value)

    local formatted_percentage = string.format(
        "%.1f%%",
        value
    )

    cpu.markup = helpers.colorize_text(formatted_percentage .. " ", beautiful.orange)

end)

--awesome.connect_signal("watches::cpu_cores", function(cpu_rows)
--    popup:setup {
--        {
--            --cpu_rows,
--            {
--                orientation = 'horizontal',
--                forced_height = 15,
--                --color = beautiful.bg_focus,
--                widget = wibox.widget.separator
--            },
--            --create_process_header{with_action_column = enable_kill_button},
--            --process_rows,
--            layout = wibox.layout.fixed.vertical,
--        },
--        margins = 8,
--        widget = wibox.container.margin
--    }
--end)

return cpu
