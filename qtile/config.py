# Copyright (c) 2010 Aldo Cortesi

# Copyright (c) 2012 Randall Ma
# Copyright (c) 2012-2014 Tycho Andersen
# Copyright (c) 2012 Craig Barnes
# Copyright (c) 2013 horsik
# Copyright (c) 2013 Tao Sauvage
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

import os
import re
import socket
import subprocess

from libqtile import qtile
from libqtile.config import Click, Drag, Group, Key, KeyChord, Match, Screen
from libqtile.lazy import lazy
from libqtile import bar, layout, widget, hook

from typing import List  # noqa: F401

mod = "mod4" # sets mod key to super
myTerminal = "kitty" # my preferred terminal

keys = [
    # Launch Terminal
    Key([mod], "Return",
        lazy.spawn(myTerminal),
        desc="Launch terminal"),

    # Launch Launcher
    Key([mod, "control"], "Return",
        #lazy.spawn("dmenu_run -p 'Run: '"),
        lazy.spawn("rofi -show drun -display-drun \"Run: \" -drun-display-format \"{name}\""),
        desc="Run Launcher"),

    # Kill focused window
    Key([mod], "w",
        lazy.window.kill(),
        desc="Kill focused window"),

    # reload qtile
    Key([mod, "control"], "r",
        lazy.restart(),
        desc="Restart qtile"),

    # shutdown qtile
    Key([mod, "control"], "q",
        lazy.shutdown(),
        desc="Shutdown qtile"),

    # Switch between windows in current stack pane
    Key([mod], "k",
        lazy.layout.down(),
        desc="Move focus down in stack pane"),
    Key([mod], "j",
        lazy.layout.up(),
        desc="Move focus up in stack pane"),

    # Move windows up or down in current stack
    Key([mod, "control"], "k",
        lazy.layout.shuffle_down(),
        desc="Move window down in current stack "),
    Key([mod, "control"], "j",
        lazy.layout.shuffle_up(),
        desc="Move window up in current stack "),

    # Expand/Shrink window
    Key([mod], "h",
        lazy.layout.shrink(),
        lazy.layout.decrease_nmaster(),
        desc="Shrink window (MonadTall), decrease number on master pane (Tile)"),
    Key([mod], "l",
        lazy.layout.grow(),
        lazy.layout.increase_nmaster(),
        desc="Shrink window (MonadTall), decrease number on master pane (Tile)"),

    # Window fullscreen
    Key([mod], "f",
        lazy.window.toggle_fullscreen(),
        desc='toggle window between minimum and maximum sizes'),

    # Switch window focus to other pane(s) of stack
    Key([mod], "space",
        lazy.layout.next(),
        desc="Switch window focus to other pane(s) of stack"),

    # Swap panes of split stack
    Key([mod, "shift"], "space",
        lazy.layout.rotate(),
        desc="Swap panes of split stack"),

    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key([mod, "shift"], "Return",
        lazy.layout.toggle_split(),
        desc="Toggle between split and unsplit sides of stack"),

    # Toggle between different layouts as defined below
    Key([mod], "Tab",
        lazy.next_layout(),
        desc="Toggle between layouts"),

    Key([mod], "r",
        lazy.spawncmd(),
        desc="Spawn a command using a prompt widget"),
]

# TODO look into
group_names = [("WWW", {'layout': 'monadtall'}),
               ("DEV", {'layout': 'monadtall'}),
               ("SYS", {'layout': 'monadtall'}),
               ("DOC", {'layout': 'monadtall'}),
               ("VBOX", {'layout': 'monadtall'}),
               ("CHAT", {'layout': 'monadtall'}),
               ("MUS", {'layout': 'monadtall'}),
               ("VID", {'layout': 'monadtall'}),
               ("GFX", {'layout': 'floating'})]


groups = [Group(i) for i in "arstneio"]

for i in groups:
    keys.extend([
        # mod1 + letter of group = switch to group
        Key([mod], i.name, lazy.group[i.name].toscreen(),
            desc="Switch to group {}".format(i.name)),

        # mod1 + shift + letter of group = switch to & move focused window to group
        Key([mod, "shift"], i.name, lazy.window.togroup(i.name, switch_group=True),
            desc="Switch to & move focused window to group {}".format(i.name)),
        # Or, use below if you prefer not to switch to that group.
        # # mod1 + shift + letter of group = move focused window to group
        # Key([mod, "shift"], i.name, lazy.window.togroup(i.name),
        #     desc="move focused window to group {}".format(i.name)),
    ])

layout_theme = {
    "border_width": 2,
    "margin": 8,
    "border_focus": "e1acff",
    "border_normal": "1D2330"
}

layouts = [
    layout.MonadTall(**layout_theme),
    layout.MonadWide(**layout_theme),
    layout.Matrix(**layout_theme),
    layout.Max(**layout_theme),
    layout.Tile(shift_windows=True, **layout_theme),
    layout.Stack(num_stacks=2),
    # Try more layouts by unleashing below layouts.
    # layout.Bsp(),
    # layout.Columns(),
    # layout.MonadWide(),
    # layout.RatioTile(),
    # layout.TreeTab(),
    # layout.VerticalTile(),
    # layout.Zoomy(),
]

colors = [
    ["#1d2021", "#1d2021"],  # 0 -  background
    ["#3c3836", "#3c3836"],  # 2 -  background lighter
    ["#fbf1c7", "#fbf1c7"],  # 1 -  foreground
    ["#fb4934", "#fb4934"],  # 3 -  red
    ["#b8bb26", "#b8bb26"],  # 4 -  green
    ["#fabd2f", "#fabd2f"],  # 5 -  yellow
    ["#83a598", "#83a598"],  # 6 -  blue
    ["#d3869b", "#d3869b"],  # 7 -  magenta
    ["#8ec07c", "#8ec07c"],  # 8 -  cyan
    ["#f9f5d7", "#f9f5d7"],  # 9 -  white
    ["#928374", "#928374"],  # 10 - grey
    ["#fe8019", "#fe8019"],  # 11 - orange
]

prompt = "{0}@{1}: ".format(os.environ["USER"], socket.gethostname())

def bluetooth():
    return (
        subprocess.check_output(["./.config/qtile/system-bluetooth-bluetoothctl.sh"])
        .decode("utf-8")
        .strip()
    )

def todays_date():
    qtile.cmd_spawn("./.config/qtile/calendar.sh")


def open_powermenu():
    qtile.cmd_spawn("./.config/rofi/powermenu/powermenu.sh")

def open_pavu():
    qtile.cmd_spawn("pavucontrol")


def toggle_bluetooth():
    qtile.cmd_spawn("./.config/qtile/system-bluetooth-bluetoothctl.sh --toggle")


def open_bt_menu():
    qtile.cmd_spawn("blueman")

##### DEFAULT WIDGET SETTINGS #####
widget_defaults = dict(
    font="MonoLisa",
    fontsize = 16,
    padding = 3,
    background=colors[0]
)
extension_defaults = widget_defaults.copy()


def init_widgets_list():
    widgets_list = [
            # Initial Spacer
            widget.Sep(
                linewidth = 0,
                padding = 6,
                foreground = colors[2],
                background = colors[1]
                ),
            # Python Image to launch terminal
            widget.Image(
                     filename = "~/.config/qtile/python.png",
                     scale = "False",
                     mouse_callbacks = {'Button1': lambda: qtile.cmd_spawn(myTerminal)}
                     ),
            # Group Box
            widget.Sep(
                linewidth = 0,
                padding = 6,
                foreground = colors[2],
                background = colors[1]
                ),
            widget.GroupBox(
                font = "MonoLisa",
                fontsize = 11,
                margin_y = 3,
                margin_x = 0,
                padding_y = 5,
                padding_x = 3,
                borderwidth = 3,
                active = colors[5],
                inactive = colors[2],
                rounded = True,
                highlight_color = colors[0],
                this_current_screen_border = colors[6],
                this_screen_border = colors[4],
                other_current_screen_border = colors[6],
                other_screen_border = colors[4],
                foreground = colors[2],
                background = colors[1]
                ),
            # Space separator
            widget.Sep(
                linewidth = 0,
                padding = 40,
                foreground = colors[2],
                background = colors[1]
                ),
            # Widow Name
            widget.WindowName(
                    max_chars = 25,
                    empty_string = '---',
                    foreground = colors[6],
                    background = colors[1],
                    padding = 0
                    ),
            # System Tray
            widget.Systray(
                    background = colors[1],
                    padding = 5
                    ),
            widget.Sep(
                    linewidth = 0,
                    padding = 6,
                    foreground = colors[1],
                    background = colors[1]
                    ),
            # Thermal Sensor
            widget.ThermalSensor(
                    foreground = colors[5],
                    background = colors[0],
                    threshold = 90,
                    padding = 5
                    ),
            # Updates
            widget.TextBox(
                    font="MonoLisa Nerd Font",
                    fontsize = 16,
                    text = ' ',
                    background = colors[1],
                    foreground = colors[0],
                    padding = 0,
                    ),
            widget.CheckUpdates(
                    update_interval = 1800,
                    distro = "Arch_checkupdates",
                    display_format = "{updates} Updates",
                    foreground = colors[5],
                    mouse_callbacks = {'Button1': lambda: qtile.cmd_spawn(myTerminal + ' -e sudo pacman -Syu')},
                    background = colors[0]
                    ),
            widget.TextBox(
                    font="MonoLisa Nerd Font",
                   text = ' ',
                   background = colors[1],
                   foreground = colors[0],
                   padding = 0,
                   fontsize = 16
                   ),
            # Memory
            widget.TextBox(
                    font="MonoLisa Nerd Font",
                    text = ' ',
                    fontsize = 16,
                    background = colors[1],
                    foreground = colors[0],
                    padding = 0,
                    ),
            widget.Memory(
                    foreground = colors[5],
                    background = colors[0],
                    mouse_callbacks = {'Button1': lambda: qtile.cmd_spawn(myTerminal + ' -e htop')},
                    padding = 5
                    ),
            widget.TextBox(
                    font="MonoLisa Nerd Font",
                   text = ' ',
                   background = colors[1],
                   foreground = colors[0],
                   padding = 0,
                   fontsize = 16
                   ),
            # Volume
            widget.TextBox(
                    font="MonoLisa Nerd Font",
                    fontsize = 16,
                    text = ' ',
                    background = colors[1],
                    foreground = colors[0],
                    padding = 0,
                    ),
            widget.TextBox(
                    text=" ",
                    foreground=colors[7],
                    background=colors[0],
                    font="Font Awesome 5 Free Solid",
                    # fontsize=38,
                    ),
            widget.PulseVolume(
                    foreground=colors[7],
                    background=colors[0],
                    mouse_callbacks={"Button3": open_pavu},
                    padding = 5,
                    ),
            widget.TextBox(
                    font="MonoLisa Nerd Font",
                   text = ' ',
                   background = colors[1],
                   foreground = colors[0],
                   padding = 0,
                   fontsize = 16
                   ),
            # Current Layout
            widget.TextBox(
                    font="MonoLisa Nerd Font",
                    fontsize = 16,
                    text = ' ',
                    background = colors[1],
                    foreground = colors[0],
                    padding = 0,
                    ),
            widget.CurrentLayoutIcon(
                    custom_icon_paths = [os.path.expanduser("~/.config/qtile/icons")],
                    foreground = colors[5],
                    background = colors[0],
                    padding = 0,
                    scale = 0.7
                    ),
            widget.CurrentLayout(
                    foreground = colors[5],
                    background = colors[0],
                    padding = 5
                    ),
            widget.TextBox(
                    font="MonoLisa Nerd Font",
                   text = ' ',
                   background = colors[1],
                   foreground = colors[0],
                   padding = 0,
                   fontsize = 16
                   ),
            # Bluetooth
            widget.TextBox(
                    font="MonoLisa Nerd Font",
                    fontsize = 16,
                    text = ' ',
                    background = colors[1],
                    foreground = colors[0],
                    padding = 0,
                    ),
            widget.GenPollText(
                    func=bluetooth,
                    background=colors[0],
                    foreground=colors[6],
                    update_interval=3,
                    mouse_callbacks={
                        "Button1": toggle_bluetooth,
                        "Button3": open_bt_menu,
                        },
                    ),
            widget.TextBox(
                    font="MonoLisa Nerd Font",
                   text = ' ',
                   background = colors[1],
                   foreground = colors[0],
                   padding = 0,
                   fontsize = 16
                   ),
            # Clock
            widget.TextBox(
                    font="MonoLisa Nerd Font",
                    fontsize = 16,
                    text = ' ',
                    background = colors[1],
                    foreground = colors[0],
                    padding = 0,
                    ),
            widget.TextBox(
                    text="",
                    font="Font Awesome 5 Free Solid",
                    foreground=colors[8],  # fontsize=38
                    background=colors[0],
                    ),
            widget.Clock(
                    foreground = colors[8],
                    background = colors[0],
                    format = "%A, %B %d - %H:%M "
                    ),
            widget.TextBox(
                    font="MonoLisa Nerd Font",
                   text = ' ',
                   background = colors[1],
                   foreground = colors[0],
                   padding = 0,
                   fontsize = 16
                   ),
            # Poweroff Button
            widget.TextBox(
                    font="MonoLisa Nerd Font",
                    fontsize = 16,
                    text = ' ',
                    background = colors[1],
                    foreground = colors[0],
                    padding = 0,
                    ),
            widget.TextBox(
                    text="⏻",
                    foreground=colors[5],
                    font="Font Awesome 5 Free Solid",
                    fontsize=16,
                    padding=10,
                    mouse_callbacks={"Button1": open_powermenu},
                    ),
            widget.TextBox(
                    font="MonoLisa Nerd Font",
                   text = ' ',
                   background = colors[1],
                   foreground = colors[0],
                   padding = 0,
                   fontsize = 16
                   ),
            ]
    return widgets_list

def init_widgets_screen1():
    widgets_screen1 = init_widgets_list()
    return widgets_screen1                       # Slicing removes unwanted widgets on Monitors 1,3

def init_widgets_screen2():
    widgets_screen2 = init_widgets_list()
    return widgets_screen2                       # Monitor 2 will display all widgets in widgets_list

def init_screens():
    return [Screen(top=bar.Bar(widgets=init_widgets_screen1(), opacity=1.0, size=20)),
            Screen(top=bar.Bar(widgets=init_widgets_screen2(), opacity=1.0, size=20)),
            Screen(top=bar.Bar(widgets=init_widgets_screen1(), opacity=1.0, size=20))]

if __name__ in ["config", "__main__"]:
    screens = init_screens()
    widgets_list = init_widgets_list()
    widgets_screen1 = init_widgets_screen1()
    widgets_screen2 = init_widgets_screen2()

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front())
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: List
main = None  # WARNING: this is deprecated and will be removed soon
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(float_rules=[
    # Run the utility of `xprop` to see the wm class and name of an X client.
     # default_float_rules include: utility, notification, toolbar, splash, dialog,
    # file_progress, confirm, download and error.
    *layout.Floating.default_float_rules,
    Match(wm_class='pinentry-gtk-2'),  # GPG key password entry
])
auto_fullscreen = True
focus_on_window_activation = "smart"

@hook.subscribe.startup_once
def start_once():
    home = os.path.expanduser('~')
    subprocess.call([home + '/.config/qtile/autostart.sh'])

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"
