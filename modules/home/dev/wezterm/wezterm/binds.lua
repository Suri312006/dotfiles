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

        --Pane Table
        {
            key = 'p',
            mods = 'ALT',
            action = act.ActivateKeyTable {
                name = 'pane',
                -- timeout_milliseconds = 1000
                oneshot = false
            }
        },
        {
            key = 't',
            mods = 'ALT',
            action = act.ActivateKeyTable {
                name = 'tab',
                -- timeout_milliseconds = 1000
                oneshot = false
            },
        },

        -- Pane Movements
        {
            key = 'UpArrow',
            mods = 'ALT',
            action = act.ActivatePaneDirection 'Up',

        },
        {
            key = 'RightArrow',
            mods = 'ALT',
            action = act.ActivatePaneDirection 'Right',

        },
        {
            key = 'DownArrow',
            mods = 'ALT',
            action = act.ActivatePaneDirection 'Down',

        },
        {
            key = 'LeftArrow',
            mods = 'ALT',
            action = act.ActivatePaneDirection 'Left',

        },



        -- easy splits
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

        -- launcher
        {
            key = 'w',
            mods = 'ALT',
            action = act.ShowLauncherArgs { flags = "WORKSPACES|FUZZY" },
        },

        {
            key = 'l',
            mods = 'ALT',
            action = act.ShowLauncherArgs { flags = "FUZZY|TABS|LAUNCH_MENU_ITEMS|DOMAINS|KEY_ASSIGNMENTS|WORKSPACES|COMMANDS" },
        },

        -- force quit
        {
            key = 'q',
            mods = 'ALT',
            action = act.QuitApplication
        },


        -- pane full screen
        {
            key = 'f',
            mods = 'ALT',
            action = act.TogglePaneZoomState,

        }




    }

    config.mouse_bindings = {
        -- Ctrl-click will open the link under the mouse cursor
        {
            event = { Up = { streak = 1, button = 'Left' } },
            mods = 'SHIFT',
            action = wezterm.action.OpenLinkAtMouseCursor,
        },
    }

    -- easy tab switching
    for i = 1, 9 do
        -- CTRL+ALT + number to activate that tab
        table.insert(config.keys, {
            key = tostring(i),
            mods = 'ALT',
            action = act.ActivateTab(i - 1),
        })
    end

    for i = 1, 9 do
        -- CTRL+ALT + number to move to that position
        table.insert(config.keys, {
            key = tostring(i),
            mods = 'CTRL|ALT',
            action = act.MoveTab(i - 1),
        })
    end
    config.key_tables = {
        pane = {
            {
                key = 'n',
                action = act.SplitPane {
                    direction = 'Right',
                    size = { Percent = 50 },
                },
            },
            {
                key = 'q',
                action = act.CloseCurrentPane {
                    confirm = true,
                },
            },
            {

                key = 's',
                action = act.PaneSelect {
                    alphabet = 'arstgmneio',
                },
            },
            {
                key = 'r',
                action = act.ActivateKeyTable {
                    name = 'pane_resize',
                    oneshot = false,
                },

            }
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
        },

        pane_resize = {
            { key = 'LeftArrow',  action = act.AdjustPaneSize { 'Left', 1 } },
            { key = 'h',          action = act.AdjustPaneSize { 'Left', 1 } },

            { key = 'RightArrow', action = act.AdjustPaneSize { 'Right', 1 } },
            { key = 'l',          action = act.AdjustPaneSize { 'Right', 1 } },

            { key = 'UpArrow',    action = act.AdjustPaneSize { 'Up', 1 } },
            { key = 'k',          action = act.AdjustPaneSize { 'Up', 1 } },

            { key = 'DownArrow',  action = act.AdjustPaneSize { 'Down', 1 } },
            { key = 'j',          action = act.AdjustPaneSize { 'Down', 1 } },

            -- Cancel the mode by pressing escape
            { key = 'Escape',     action = 'PopKeyTable' },
        },

    }
end

return module
