local wezterm = require 'wezterm'


local mux = wezterm.mux
wezterm.on('gui-startup', function(cmd)
    local args = {}
    if cmd then
        args = cmd.args
    end


    local cats_dir = wezterm.home_dir .. '/dev/personal/coupled-cats'
    local rs_t, rs_p, rs_w = mux.spawn_window {
        workspace = 'coupled-cats',
        cwd = cats_dir .. '/rs',
        args = args
    }

    rs_p:send_text 'nvim .\n'
    rs_t:set_title 'dev'


    local build_t, build_p, build_w = rs_w:spawn_tab {
        cwd = cats_dir
    }


    local dev_server_p = build_p:split {
        direction = 'Left',
        size = 0.5,
        cwd = cats_dir
    }


    build_t:set_title 'build'

    dev_server_p:send_text 'go run .'

    build_p:send_text 'cargo run --'


    local notes_t, notes_p, notes_w = build_w:spawn_tab {
        cwd = cats_dir .. '/.notes'
    }

    notes_p:send_text 'nvim .\n'

    notes_t:set_title 'notes'


    rs_t:activate()
end)
