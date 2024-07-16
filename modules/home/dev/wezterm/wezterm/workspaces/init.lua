local wezterm = require 'wezterm'

require('workspaces.school')
require('workspaces.dots')

local mux = wezterm.mux
wezterm.on('gui-startup', function(cmd)
    mux.set_active_workspace 'default'
end)
