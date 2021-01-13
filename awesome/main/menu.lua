-- Standard awesome library
local awful = require("awful")
local hotkeys_popup = require("awful.hotkeys_popup").widget
-- Theme handling library
local beautiful = require("beautiful") -- for awesome.icon

local Menu = {}
local M = {} -- module

-- reading
-- https://awesomewm.org/apidoc/popups%20and%20bars/awful.menu.html

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

-- This is used later as the default terminal and editor to run.
-- local terminal = "xfce4-terminal"
local terminal = RC.vars.terminal

-- Variable definitions
-- This is used later as the default terminal and editor to run.
local editor = os.getenv("EDITOR") or "nvim"
local editor_cmd = terminal .. " -e " .. editor

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

Menu.awesome = {
  { "hotkeys", function()
      hotkeys_popup.show_help(nil, awful.screen.focused())
    end },
  { "manual", terminal .. " -e man awesome" },
  { "edit config", editor_cmd .. " " .. awesome.conffile },
  { "Terminal", terminal },
  { "Shutdown/Logout", "oblogout" },
  { "restart", awesome.restart },
  { "quit", function() awesome.quit() end }
}

Menu.favorite = {
  { "thunar", "thunar" },
  { "firefox", "firefox", awful.util.getdir("config") .. "/firefox.png" },
}

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

function M.get()

  -- Main Menu
  local menu_items = {
    { "awesome", Menu.awesome, beautiful.awesome_subicon },
    { "open terminal", terminal },
    { "favorite", Menu.favorite }
  }

  return menu_items
end

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

return setmetatable({}, { __call = function(_, ...) return M.get(...) end })
