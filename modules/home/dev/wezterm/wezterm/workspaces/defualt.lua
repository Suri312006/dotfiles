local wezterm = require 'wezterm'
local mux = wezterm.mux
wezterm.on('gui-startup', function(cmd)
    local args = {}
    if cmd then
        args = cmd.args
    end

    local tab, pane, window = mux:spawn_window {
        workspace = 'default',
        cwd = wezterm.home_dir .. '',
        args = args
    }

    mux.set_active_workspace 'default'
end)
