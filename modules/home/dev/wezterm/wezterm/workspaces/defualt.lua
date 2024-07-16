local wezterm = require 'wezterm'

local mux = wezterm.mux


wezterm.on('gui-startup', function(cmd)
    -- allow `wezterm start -- something` to affect what we spawn
    -- in our initial window
    local args = {}
    if cmd then
        args = cmd.args
    end
    local home = wezterm.home_dir

    local tab, pane, window = mux.spawn_window {
        workspace = 'school',
        cwd = home,
        args = args
    }
    mux.set_active_workspace 'default'
end)

return {}
