local wezterm = require 'wezterm'

local module = {}



function module.apply_to_config(config)
    local act = wezterm.action;

    config.keys = {
        {
            key = 'v',
            mods = 'ALT',
            action = act.SplitHorizontal { domain = 'CurrentPaneDomain' }

        },
        {
            key = 'x',
            mods = 'ALT',
            action = act.SplitVertical { domain = 'CurrentPaneDomain' }
        },
        {
            key = 's',
            mods = 'ALT',
            action = act.ShowLauncherArgs { flags = "WORKSPACES|DOMAINS|FUZZY" },
        },
        {
            key = 'p',
            mods = 'ALT',
            action = act.PaneSelect {
                alphabet = 'arstgmneio'
            },
        },

        {
            key = 'q',
            mods = 'SUPER',
            action = act.QuitApplication
        },
        {
            key = 'q',
            mods = 'ALT',
            action = act.CloseCurrentPane { confirm = true }
        },
        {
            key = 'q',
            mods = 'CTRL',
            action = act.CloseCurrentTab { confirm = true }
        }
    }
end

return module
