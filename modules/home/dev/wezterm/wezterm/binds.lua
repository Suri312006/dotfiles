local wezterm = require 'wezterm'

local module = {}

-- Show which key table is active in the status area
wezterm.on('update-right-status', function(window, pane)
    local name = window:active_key_table()
    if name then
        name = 'TABLE: ' .. name
    end
    window:set_right_status(name or '')
end)


function module.apply_to_config(config)
    local act = wezterm.action;


    config.keys = {
        {
            key = 'p',
            mods = 'ALT',
            action = act.ActivateKeyTable {
                name = 'pane',
                timeout_milliseconds = 1000
            }
        },
        {
            key = 't',
            mods = 'ALT',
            action = act.ActivateKeyTable {
                name = 'tab',
                timeout_milliseconds = 1000
            },
        },

        {
            key = 'v',
            mods = 'ALT',
            action = act.SplitVertical { domain = 'CurrentPaneDomain' }
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
        -- {
        --     key = 'p',
        --     mods = 'ALT',
        --     action = act.PaneSelect {
        --         alphabet = 'arstgmneio'
        --     },
        -- },

        {
            key = 'q',
            mods = 'ALT',
            action = act.QuitApplication
        },
        -- {
        --     key = 'q',
        --     mods = 'ALT',
        --     action = act.CloseCurrentPane { confirm = true }
        -- },
        -- {
        --     key = 'q',
        --     mods = 'CTRL',
        --     action = act.CloseCurrentTab { confirm = true }
        -- }
    }

    config.key_tables = {
        pane = {
            {
                key = 'n',
                action = act.SplitPane {
                    direction = 'Next',
                    size = { Percent = 50 },
                }
            },
            {
                key = 'q',
                action = act.CloseCurrentPane { confirm = true }
            },
            {

                key = 's',
                action = act.PaneSelect {
                    alphabet = 'arstgmneio'
                },
            }
            -- TODO:maybe add a way to resize pane? nested key tables
        },
        tab = {
            {
                key = 'n',
                action = act.SpawnTab 'CurrentPaneDomain'
            },
            {
                key = 'q',
                action = act.CloseCurrentTab { confirm = true }
            },


        }


    }
end

return module
