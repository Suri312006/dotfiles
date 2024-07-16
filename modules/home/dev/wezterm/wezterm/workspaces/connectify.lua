local wezterm = require 'wezterm'


local mux = wezterm.mux
wezterm.on('gui-startup', function(cmd)
    local args = {}
    if cmd then
        args = cmd.args
    end


    local connectify_dir = wezterm.home_dir .. '/dev/work/ConnectifyAI'
    local tab, pane, window = mux.spawn_window {
        workspace = 'connectify',
        cwd = connectify_dir,
        args = 'nvim .'
    }

    local notes_t, notes_p, notes_w = window:spawn_tab {
        cwd = connectify_dir .. 'notes',
        args = 'nvim .'
    }

    local build_tab, build_pane, build_window = notes_w:spawn_tab {
        cwd = connectify_dir .. '/connectifyai/frontend'
    }

    local dev_server = build_pane:split {
        direction = 'Left',
        size = 0.5,
        cwd = connectify_dir .. '/connectifyai/backend/cmd/connserver'
    }


    build_tab:set_title 'build'

    build_pane:send_text 'bun run dev'

    dev_server:send_text 'go run .'

    tab:activate()
end)
