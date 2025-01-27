
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
    local dev_dir = wezterm.home_dir .. '/Documents/quarters/2025_Winter/writ2'

    local tab, pane, window = mux.spawn_window {
        workspace = 'writ2',
        cwd = dev_dir,
        args = args
    }

    tab:set_title "Helix"

    pane:send_text "hx .\n"

    local r_t, r_p, r_w= window:spawn_tab({
        cwd = dev_dir,
            })

    r_t:set_title "Zathura"


    tab:activate()


end)

return {}
