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
    local dev_dir = wezterm.home_dir .. '/dev/school/cse130'

    local tab, pane, window = mux.spawn_window {
        workspace = 'cse130',
        cwd = dev_dir,
        args = args
    }

    tab:set_title "Helix"

    local r_t, r_p, r_w= window:spawn_tab({
        cwd = dev_dir,
            })

            local g_t, g_p, g_w = r_w:spawn_tab({
                cwd = dev_dir .. '/sjammish'
            })

            g_p:send_text("lazygit \n")

    r_t:set_title "Build"
    r_p:send_text("nix-shell\n")
    r_p:send_text("cd sjammish\n")

    tab:activate()


end)

return {}
