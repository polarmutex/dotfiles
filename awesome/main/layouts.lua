-- Standard awesome library
local awful = require("awful")
local lain = require("lain")

local _M = {}

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

function _M.get ()
    -- Table of layouts to cover with awful.layout.inc, order matters.
    local layouts = {

        awful.layout.suit.tile,
        awful.layout.suit.tile.bottom,
        awful.layout.suit.tile.left,
        awful.layout.suit.tile.top,

        lain.layout.centerwork,
        lain.layout.cascade.tile,

        --awful.layout.suit.fair,
        --awful.layout.suit.fair.horizontal,

        --awful.layout.suit.spiral,
        --awful.layout.suit.spiral.dwindle,

        --awful.layout.suit.max,
        --awful.layout.suit.max.fullscreen,
        --awful.layout.suit.magnifier,

        --awful.layout.suit.corner.nw
        --awful.layout.suit.corner.ne,
        --awful.layout.suit.corner.sw,
        --awful.layout.suit.corner.se,

        awful.layout.suit.floating,
  }

  return layouts
end

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

return setmetatable({}, { __call = function(_, ...) return _M.get(...) end })
