local wezterm = require 'wezterm'

require('workspaces.school')
require('workspaces.dots')
require('workspaces.connectify')

local mux = wezterm.mux
wezterm.on('gui-startup', function(cmd)
    local tab, pane, window = mux:spawn_window {
        workspace = 'default',
        cwd = wezterm.home_dir
    }
    mux.set_active_workspace 'default'
end)
