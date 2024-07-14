local wezterm = require 'wezterm'


-- function module.apply_to_config(config)
local mux = wezterm.mux
wezterm.on('gui-startup', function(cmd)
    -- allow `wezterm start -- something` to affect what we spawn
    -- in our initial window
    local args = {}
    if cmd then
        args = cmd.args
    end
    local school_dir = wezterm.home_dir .. '/dev/school'
    local tab, pane, window = mux.spawn_window {
        workspace = 'school',
        cwd = school_dir,
        args = args
    }
end)

return {}
