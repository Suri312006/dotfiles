local wezterm = require 'wezterm'


local mux = wezterm.mux
wezterm.on('gui-startup', function(cmd)
    local args = {}
    if cmd then
        args = cmd.args
    end


    local t2t_dir = wezterm.home_dir .. '/dev/personal/term2term'
    local rs_t, rs_p, rs_w = mux.spawn_window {
        workspace = 'term2term',
        cwd = t2t_dir .. '/client',
        args = args
    }

    rs_p:send_text 'nvim .\n'
    rs_t:set_title 'rs'

    local go_t, go_p, go_w = rs_w:spawn_tab {
        cwd = t2t_dir .. '/server',
    }

    go_p:send_text 'nvim .\n'
    go_t:set_title 'go'

    local build_t, build_p, build_w = go_w:spawn_tab {
        cwd = t2t_dir .. '/client'
    }

    local dev_server_p = build_p:split {
        direction = 'Left',
        size = 0.5,
        cwd = t2t_dir .. '/server/cmd/t2tServer'
    }


    build_t:set_title 'build'

    dev_server_p:send_text 'go run .'

    build_p:send_text 'cargo run --'


    local notes_t, notes_p, notes_w = build_w:spawn_tab {
        cwd = t2t_dir .. '/.notes'
    }

    notes_p:send_text 'nvim .\n'

    notes_t:set_title 'notes'

    local proto_t, proto_p, proto_w = notes_w:spawn_tab {
        cwd = t2t_dir .. '/proto'
    }

    proto_p:send_text 'nvim .\n'
    proto_t:set_title 'proto'

    rs_t:activate()
end)
