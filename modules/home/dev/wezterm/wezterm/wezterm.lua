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
config.tab_bar_at_bottom = true;
return config
