local apps = require('configuration.apps')
local filesystem = require('gears.filesystem')

-- List of apps to start once on start-up
return {
  run_on_start_up = {
    -- compositer
    'picom --config ' .. '~/.config/picom/picom.conf',

    -- Network Manager Applet
    --'nm-applet --indicator', -- wifi

    -- Bluetooth
    'blueman-applet', -- bluetooth tray

    -- Media controller daemon
    "playerctld daemon",
  }
}
