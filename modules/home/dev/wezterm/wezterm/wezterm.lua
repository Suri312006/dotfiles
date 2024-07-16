-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices
local binds = require 'binds'
local fonts = require 'fonts'
binds.apply_to_config(config)
fonts.apply_to_config(config)
require('workspaces')


-- For example, changing the color scheme:
config.color_scheme = 'Gruvbox dark, hard (base16)';


-- config.enable_wayland = false;


config.hide_tab_bar_if_only_one_tab = true;

-- Monaspace:  https://monaspace.githubnext.com/
-- Based upon, contributed to:  https://gist.github.com/ErebusBat/9744f25f3735c1e0491f6ef7f3a9ddc3



-- keybinds
-- config.keys = {
--     {
--         key = 'v',
--         mods = 'CTRL',
--         action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' }
--
--     },
--     {
--         key = 'x',
--         mods = 'CTRL',
--         action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' }
--     },
--     {
--         key = 's',
--         mods = 'CTRL',
--         action = wezterm.action.ShowLauncherArgs { flags = "WORKSPACES|DOMAINS|FUZZY" },
--     }
-- }

-- local mux = wezterm.mux
--
-- wezterm.on('gui-startup', function(cmd)
--     -- allow `wezterm start -- something` to affect what we spawn
--     -- in our initial window
--     local args = {}
--     if cmd then
--         args = cmd.args
--     end

    -- Set a workspace for coding on a current project
    -- Top pane is for the editor, bottom pane is for the build tool
    -- local project_dir = wezterm.home_dir .. '/wezterm'
    -- local tab, build_pane, window = mux.spawn_window {
    --     workspace = 'coding',
    --     cwd = project_dir,
    --     args = args,
    -- }
    -- local editor_pane = build_pane:split {
    --     direction = 'Top',
    --     size = 0.6,
    --     cwd = project_dir,
    -- }
    -- -- may as well kick off a build in that pane
    -- build_pane:send_text 'cargo build\n'
    --
    -- -- A workspace for interacting with a local machine that
    -- -- runs some docker containners for home automation
    -- local tab, pane, window = mux.spawn_window {
    --     workspace = 'automation',
    --     args = { 'ssh', 'vault' },
    -- }



    -- local school_dir = wezterm.home_dir .. '/dev/school'
    -- local tab, pane, window = mux.spawn_window {
    --     workspace = 'school',
    --     cwd = school_dir,
    --     args = args
    -- }

    -- local default_dir = wezterm.home_dir .. '/dev'
    -- local tab, pane, window = mux.spawn_window {
    --     workspace = 'default',
    --     cwd = default_dir,
    --     args = args
    -- }
    --
    -- local connectify_dir = wezterm.home_dir .. '/dev/work/ConnectifyAI'
    -- local tab, pane, window = mux.spawn_window {
    --     workspace = 'connectify',
    --     cwd = connectify_dir,
    --     args = args
    -- }
    --
    -- local build_tab, build_pane, build_window = window:spawn_tab {}
    -- local dev_server = build_pane:split {
    --     direction = 'Left',
    --     size = 0.5,
    --     cwd = connectify_dir .. '/connectifyai/backend/cmd/connserver'
    -- }
    --
    -- build_tab:set_title 'build'
    --
    -- dev_server:send_text 'go run .'
    --
    -- tab:activate()


    -- We want to startup in the coding workspace
    -- mux.set_active_workspace 'default'
-- end)


-- config.disable_default_key_bindings = true;

-- config.keys = {
--     -- This will create a new split and run the `top` program inside it
--     {
--         key = '%',
--         mods = 'CTRL|SHIFT|ALT',
--         action = wezterm.action.SplitPane {
--             direction = 'Left',
--             -- command = { args = { 'top' } },
--             size = { Percent = 50 },
--         },
--
--     },
--
-- }
-- and finally, return the configuration to wezterm
return config
