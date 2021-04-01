---------------------------
-- Default awesome theme --
---------------------------

local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi
--local xrdb = xresources.get_current_theme()
local gears = require('gears')
local helpers = require('helpers')

local gfs = require("gears.filesystem")
local themes_path = gfs.get_configuration_dir() .. "themes/"
local default_themes_path = themes_path .. "default/"
local polar_themes_path = themes_path .. "polarmutex/"

local theme = {}

-- Dark Gruvbox Colors
theme.lightred    = "#fb4934"
theme.red         = "#cc241d"
theme.lightorange = "#fe8019"
theme.orange      = "#d65d0e"
theme.lightyellow = "#fabd2f"
theme.yellow      = "#d79921"
theme.lightgreen  = "#b8bb26"
theme.green       = "#98971a"
theme.lightaqua   = "#8ec07c"
theme.aqua        = "#689d6a"
theme.lightblue   = "#83a598"
theme.blue        = "#458588"
theme.lightpurple = "#d3869b"
theme.purple      = "#b16286"
theme.fg0         = "#fbf1c7"
theme.fg1         = "#ebdbb2"
theme.fg2         = "#d5c4a1"
theme.fg3         = "#bdae93"
theme.fg4         = "#a89984"
theme.gray        = "#928374"
theme.bg4         = "#7c6f64"
theme.bg3         = "#665c54"
theme.bg2         = "#504945"
theme.bg1         = "#3c3836"
theme.bg0_s       = "#32302f"
theme.bg0         = "#282828"
theme.bg0_h       = "#1d2021"

theme.xbackground = theme.bg0_h
theme.xforeground = theme.fg1
theme.xcolor0 = theme.bg0
theme.xcolor1 = theme.red
theme.xcolor2 = theme.green
theme.xcolor3 = theme.yellow
theme.xcolor4 = theme.blue
theme.xcolor5 = theme.purple
theme.xcolor6 = theme.aqua
theme.xcolor7 = theme.fg4
theme.xcolor8 = theme.gray
theme.xcolor9 = theme.lightred
theme.xcolor10 = theme.lightgreen
theme.xcolor11 = theme.lightyellow
theme.xcolor12 = theme.lightblue
theme.xcolor13 = theme.lightpurple
theme.xcolor14 = theme.lightaqua
theme.xcolor15 = theme.fg1

-- Fonts
theme.font_name = "MonoLisa "
theme.font = theme.font_name .. "10"
theme.icon_font = theme.font_name .. "Nerd Font 18"
theme.font_taglist = theme.font_name .. "Nerd Font 14"
theme.max_font = "FiraCode Nerd Font Mono 10"

-- Background Colors

theme.bg_dark = theme.xcolor0
theme.bg_normal = theme.xbackground
theme.bg_focus = theme.xcolor0
theme.bg_urgent = theme.xcolor8
theme.bg_minimize = theme.xcolor8

-- Foreground Colors

theme.fg_normal = theme.xcolor7
theme.fg_focus = theme.xcolor4
theme.fg_urgent = theme.xcolor3
theme.fg_minimize = theme.xcolor8

theme.button_close = theme.xcolor1

-- Borders

theme.border_width = dpi(3)
theme.oof_border_width = dpi(0)
theme.border_normal = theme.xcolor0
theme.border_focus = theme.xcolor0
theme.border_radius = dpi(12)
theme.client_radius = dpi(12)
theme.widget_border_width = dpi(1)
theme.widget_border_color = theme.xcolor0

-- Taglist

-- Generate taglist squares:
local taglist_square_size = dpi(0)
theme.taglist_squares_sel = theme_assets.taglist_squares_sel(
                                taglist_square_size, theme.fg_normal)
theme.taglist_squares_unsel = theme_assets.taglist_squares_unsel(
                                  taglist_square_size, theme.fg_normal)
theme.taglist_font = theme.font_taglist
theme.taglist_bg = theme.wibar_bg
--theme.taglist_bg_focus = theme.xcolor0
--theme.taglist_fg_focus = theme.xcolor3
theme.taglist_bg_urgent = theme.xcolor0
--theme.taglist_fg_urgent = theme.xcolor6
--theme.taglist_bg_occupied = theme.xcolor0
--theme.taglist_fg_occupied = theme.xcolor6
--theme.taglist_bg_empty = theme.xcolor0
--theme.taglist_fg_empty = theme.xcolor8
theme.taglist_bg_volatile = transparent
--theme.taglist_fg_volatile = theme.xcolor11
theme.taglist_disable_icon = true
--theme.taglist_shape_focus = helpers.rrect(theme.border_radius - 3)

-- Tasklist

theme.tasklist_font = theme.font
theme.tasklist_plain_task_name = true
theme.tasklist_bg_focus = theme.xcolor0
theme.tasklist_fg_focus = theme.xcolor6
theme.tasklist_bg_minimize = theme.xcolor0 .. "70"
theme.tasklist_fg_minimize = theme.xforeground .. "70"
theme.tasklist_bg_normal = theme.xcolor0
theme.tasklist_fg_normal = theme.xforeground
theme.tasklist_disable_task_name = false
theme.tasklist_disable_icon = true
theme.tasklist_bg_urgent = theme.xcolor0
theme.tasklist_fg_urgent = theme.xcolor1
theme.tasklist_align = "center"

-- Titlebars

theme.titlebar_size = dpi(40)
theme.titlebar_height = dpi(20)
theme.titlebar_bg_focus = theme.xbackground
theme.titlebar_bg_normal = theme.xbackground
theme.titlebar_fg_normal = theme.xcolor8
theme.titlebar_fg_focus = theme.xcolor15 .. "55"

-- Edge snap

theme.snap_bg = theme.xcolor8
theme.snap_shape = helpers.rrect(0)

-- Prompts

theme.prompt_bg = transparent
theme.prompt_fg = theme.xforeground

-- Tooltips

theme.tooltip_bg = theme.xbackground
theme.tooltip_fg = theme.xforeground
theme.tooltip_font = theme.font_name .. "12"
theme.tooltip_border_width = theme.widget_border_width - 1
theme.tooltip_border_color = theme.xcolor0
theme.tooltip_opacity = 1
theme.tooltip_align = "left"

-- Menu

theme.menu_font = theme.font
theme.menu_bg_focus = theme.xcolor4
theme.menu_fg_focus = theme.xcolor7
theme.menu_bg_normal = theme.xbackground
theme.menu_fg_normal = theme.xcolor7
theme.menu_submenu_icon = gears.filesystem.get_configuration_dir() ..
                              "theme/icons/submenu.png"
theme.menu_height = dpi(20)
theme.menu_width = dpi(130)
theme.menu_border_color = "#0000000"
theme.menu_border_width = theme.border_width

-- Hotkeys Pop Up

theme.hotkeys_font = theme.font
theme.hotkeys_border_color = theme.xcolor0
theme.hotkeys_group_margin = dpi(40)
theme.hotkeys_shape = helpers.custom_shape

-- Layout List

theme.layoutlist_border_color = theme.xcolor8
theme.layoutlist_border_width = theme.border_width
-- Recolor Layout icons:
theme = theme_assets.recolor_layout(theme, theme.xforeground)

-- Gaps

theme.useless_gap = dpi(3)

-- Exit Screen

theme.exit_screen_fg = theme.xforeground
theme.exit_screen_bg = theme.xcolor0 .. "55"

-- Wibar

theme.wibar_height = dpi(34) + theme.widget_border_width
theme.wibar_margin = dpi(15)
theme.wibar_spacing = dpi(15)
theme.wibar_bg = theme.xbackground

-- Systray

theme.systray_icon_spacing = dpi(10)
theme.bg_systray = theme.xcolor0
theme.systray_icon_size = dpi(15)

-- Collision

theme.collision_focus_bg = theme.xcolor8
theme.collision_focus_fg = theme.xcolor6
theme.collision_focus_shape = helpers.rrect(theme.border_radius)
theme.collision_focus_border_width = theme.border_width
theme.collision_focus_border_color = theme.border_normal

theme.collision_focus_bg_center = theme.xcolor8
theme.collision_shape_width = dpi(50)
theme.collision_shape_height = dpi(50)
theme.collision_focus_shape_center = gears.shape.circle

theme.collision_max_bg = theme.xbackground
theme.collision_max_fg = theme.xcolor8
theme.collision_max_shape = helpers.rrect(0)
theme.bg_urgent = theme.xcolor1

theme.collision_resize_width = dpi(20)
theme.collision_resize_shape = theme.collision_focus_shape
theme.collision_resize_border_width = theme.collision_focus_border_width
theme.collision_resize_border_color = theme.collision_focus_border_color
theme.collision_resize_padding = dpi(5)
theme.collision_resize_bg = theme.collision_focus_bg
theme.collision_resize_fg = theme.collision_focus_fg

theme.collision_screen_shape = theme.collision_focus_shape
theme.collision_screen_border_width = theme.collision_focus_border_width
theme.collision_screen_border_color = theme.collision_focus_border_color
theme.collision_screen_padding = dpi(5)
theme.collision_screen_bg = theme.xbackground
theme.collision_screen_fg = theme.xcolor4
theme.collision_screen_bg_focus = theme.xcolor8
theme.collision_screen_fg_focus = theme.xcolor4

-- Tabs

theme.mstab_bar_height = dpi(60)
theme.mstab_bar_padding = dpi(0)
theme.mstab_border_radius = dpi(6)
theme.tabbar_style = "modern"
theme.tabbar_bg_focus = theme.xbackground
theme.tabbar_bg_normal = theme.xcolor0
theme.tabbar_fg_focus = theme.xcolor8
theme.tabbar_fg_normal = theme.xcolor15 .. "55"
theme.tabbar_position = "bottom"
theme.tabbar_AA_radius = 0
theme.mstab_bar_ontop = true

-- Variables set for theming notifications:
-- notification_font
-- notification_[bg|fg]
-- notification_[width|height|margin]
-- notification_[border_color|border_width|shape|opacity]
theme.notification_spacing = 10

-- Define the image to load
theme.titlebar_close_button_normal = default_themes_path.."titlebar/close_normal.png"
theme.titlebar_close_button_focus  = default_themes_path.."titlebar/close_focus.png"

theme.titlebar_minimize_button_normal = default_themes_path.."titlebar/minimize_normal.png"
theme.titlebar_minimize_button_focus  = default_themes_path.."titlebar/minimize_focus.png"

theme.titlebar_ontop_button_normal_inactive = default_themes_path.."titlebar/ontop_normal_inactive.png"
theme.titlebar_ontop_button_focus_inactive  = default_themes_path.."titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_active = default_themes_path.."titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_active  = default_themes_path.."titlebar/ontop_focus_active.png"

theme.titlebar_sticky_button_normal_inactive = default_themes_path.."titlebar/sticky_normal_inactive.png"
theme.titlebar_sticky_button_focus_inactive  = default_themes_path.."titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_active = default_themes_path.."titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_active  = default_themes_path.."titlebar/sticky_focus_active.png"

theme.titlebar_floating_button_normal_inactive = default_themes_path.."titlebar/floating_normal_inactive.png"
theme.titlebar_floating_button_focus_inactive  = default_themes_path.."titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_active = default_themes_path.."titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_active  = default_themes_path.."titlebar/floating_focus_active.png"

theme.titlebar_maximized_button_normal_inactive = default_themes_path.."titlebar/maximized_normal_inactive.png"
theme.titlebar_maximized_button_focus_inactive  = default_themes_path.."titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_active = default_themes_path.."titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_active  = default_themes_path.."titlebar/maximized_focus_active.png"

-- You can use your own layout icons like this:
theme.layout_fairh = default_themes_path.."layouts/fairhw.png"
theme.layout_fairv = default_themes_path.."layouts/fairvw.png"
theme.layout_floating  = default_themes_path.."layouts/floatingw.png"
theme.layout_magnifier = default_themes_path.."layouts/magnifierw.png"
theme.layout_max = default_themes_path.."layouts/maxw.png"
theme.layout_fullscreen = default_themes_path.."layouts/fullscreenw.png"
theme.layout_tilebottom = default_themes_path.."layouts/tilebottomw.png"
theme.layout_tileleft   = default_themes_path.."layouts/tileleftw.png"
theme.layout_tile = default_themes_path.."layouts/tilew.png"
theme.layout_tiletop = default_themes_path.."layouts/tiletopw.png"
theme.layout_spiral  = default_themes_path.."layouts/spiralw.png"
theme.layout_dwindle = default_themes_path.."layouts/dwindlew.png"
theme.layout_cornernw = default_themes_path.."layouts/cornernww.png"
theme.layout_cornerne = default_themes_path.."layouts/cornernew.png"
theme.layout_cornersw = default_themes_path.."layouts/cornersww.png"
theme.layout_cornerse = default_themes_path.."layouts/cornersew.png"

-- Generate Awesome icon:
theme.awesome_icon = theme_assets.awesome_icon(
    theme.menu_height, theme.bg_focus, theme.fg_focus
)

-- Define the icon theme for application icons. If not set then the icons
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
theme.icon_theme = nil

return theme

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
