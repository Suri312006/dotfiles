local wezterm = require 'wezterm'


-- function module.apply_to_config(config)
local mux = wezterm.mux
wezterm.on('gui', function(cmd)
    -- allow `wezterm start -- something` to affect what we spawn
    -- in our initial window
    local args = {}
    if cmd then
        args = cmd.args
    end
    local quarters_dir = wezterm.home_dir .. '/Documents/quarters'
    local dev_dir = wezterm.home_dir .. '/dev/school'

    local tab, pane, window = mux.spawn_window {
        workspace = 'school',
        cwd = quarters_dir,
        args = args
    }

    local dev_tab, dev_pane, dev_window = window:spawn_tab {
        cwd = dev_dir
    }

end)

return {}
