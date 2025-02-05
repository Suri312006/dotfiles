
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

    local class_dir = wezterm.home_dir .. 'dev/school/cse108'
    
    local dev_dir = class_dir .. '/hermes'

    local tab, pane, window = mux.spawn_window {
        workspace = 'cse108',
        cwd = dev_dir,
        args = args
    }

    tab:set_title "Helix"
    pane:send_text "hx .\n"

    local b_t, b_p, b_w = window:spawn_tab({
        cwd = dev_dir
    })

    b_p:send_text "just "

    b_t:set_title "Build"

    tab:activate()
end)

return {}
