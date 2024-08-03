local wezterm = require 'wezterm'


local mux = wezterm.mux

wezterm.on('gui-startup', function(cmd)
    local args = {}
    if cmd then
        args = cmd.args
    end

    local ll_dir = wezterm.home_dir .. '/dev/work/LightLinks'

    local ll_t, ll_p, ll_w = mux.spawn_window {
        workspace = 'LightLinks',
        cwd = ll_dir .. '/IWP/Prometheus/src',
        args = args
    }

    ll_w:spawn_tab {}
    ll_w:spawn_tab {}



    ll_t:set_title 'dev'
    ll_p:send_text 'nvim .\n'

    local notes_t, notes_p, notes_w = ll_w:spawn_tab {
        cwd = ll_dir .. '/Notes',
    }

    notes_t:set_title 'notes'
    notes_p:send_text 'nvim .\n'

    local ssh_t, ssh_p, ssh_w = notes_w:spawn_tab {
        cwd = ll_dir .. '/IWP/Prometheus/src'
    }

    ssh_t:set_title 'ssh'
    ssh_p:split {
        direction = 'Left',
        size = 0.5
    }


    ll_t:activate()
end)
