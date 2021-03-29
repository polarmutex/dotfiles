-- Standard awesome library
local gears = require("gears")
local awful = require("awful")

local M = {}
local modkey = RC.vars.modkey

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

-- Key bindings
local tag_keys = {
    'a',
    'r',
    's',
    't',
    'n',
    'e',
    'i',
    'o',
    'm',
}

function M.get(globalkeys)
  -- Bind all key numbers to tags.
  -- Be careful: we use keycodes to make it work on any keyboard layout.
  -- This should map on the top row of your keyboard, usually 1 to 9.
  for i = 1, #tag_keys do
    globalkeys = gears.table.join(globalkeys,

      --  -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
      -- View tag only.
      awful.key({ modkey }, tag_keys[i],
        function ()
          local screen = awful.screen.focused()
          local tag = screen.tags[i]
          if tag then
            tag:view_only()
          end
        end,
        {description = "view tag #"..i, group = "tag"}),

      --  -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
      -- Toggle tag display.
      awful.key({ modkey, "Control" }, tag_keys[i],
        function ()
          local screen = awful.screen.focused()
          local tag = screen.tags[i]
          if tag then
            awful.tag.viewtoggle(tag)
          end
        end,
        {description = "toggle tag #" .. i, group = "tag"}),

      --  -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
      -- Move client to tag.
      awful.key({ modkey, "Shift" }, tag_keys[i],
        function ()
          if client.focus then
            local tag = client.focus.screen.tags[i]
            if tag then
              client.focus:move_to_tag(tag)
            end
          end
        end,
        {description = "move focused client to tag #"..i, group = "tag"}),

      --  -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
      -- Toggle tag on focused client.
      awful.key({ modkey, "Control", "Shift" }, tag_keys[i],
        function ()
          if client.focus then
            local tag = client.focus.screen.tags[i]
            if tag then
              client.focus:toggle_tag(tag)
            end
          end
        end,
        {description = "toggle focused client on tag #" .. i, group = "tag"})

      --  -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
    )
  end

  return globalkeys
end

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

return setmetatable({}, { __call = function(_, ...) return M.get(...) end })
