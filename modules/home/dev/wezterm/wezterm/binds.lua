local wezterm = require 'wezterm'

local module = {}



function module.apply_to_config(config)
    config.keys = {
        {
            key = 'v',
            mods = 'CTRL',
            action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' }

        },
        {
            key = 'x',
            mods = 'CTRL',
            action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' }
        },
        {
            key = 's',
            mods = 'CTRL',
            action = wezterm.action.ShowLauncherArgs { flags = "WORKSPACES|DOMAINS|FUZZY" },
        }
    }
end

return module
