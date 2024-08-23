local wezterm = require 'wezterm'


local mux = wezterm.mux
wezterm.on('gui-startup', function(cmd)
    local args = {}
    if cmd then
        args = cmd.args
    end


    local twizzler_dir = wezterm.home_dir .. '/dev/work/Twizzler'
    local tab, pane, window = mux.spawn_window {
        workspace = 'Twizzler',
        cwd = twizzler_dir .. '/twizzler',
        args = args
    }

    pane:send_text 'nvim .\n'
    tab:set_title 'dev'

    local notes_t, notes_p, notes_w = window:spawn_tab {
        cwd = twizzler_dir .. '/notes',
    }

    notes_p:send_text 'nvim .\n'
    notes_t:set_title 'notes'

    tab:activate()
end)
