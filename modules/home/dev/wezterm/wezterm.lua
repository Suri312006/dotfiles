-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = 'Gruvbox dark, hard (base16)';

config.enable_wayland = false;

config.font_size = 10.5;
config.warn_about_missing_glyphs = true
config.freetype_load_target = 'HorizontalLcd' -- https://wezfurlong.org/wezterm/config/lua/config/freetype_load_target.html

config.dpi = 100;

-- Monaspace:  https://monaspace.githubnext.com/
-- Based upon, contributed to:  https://gist.github.com/ErebusBat/9744f25f3735c1e0491f6ef7f3a9ddc3
config.font = wezterm.font(
    { -- Normal text
        family = 'Monaspace Krypton',
        harfbuzz_features = { 'calt', 'liga', 'dlig', 'ss01', 'ss02', 'ss03', 'ss04', 'ss05', 'ss06', 'ss07', 'ss08' },
        stretch = 'UltraCondensed', -- This doesn't seem to do anything
        weight = 'Bold',
        intensity = 'Bold'
    })

config.font_rules = {
    { -- Italic
        intensity = 'Bold',
        italic = true,
        font = wezterm.font({
            -- family="Monaspace Radon",  -- script style
            family = 'Monaspace Argon', -- courier-like
            style = 'Italic',
            weight = 'Bold'
        })
    },

    { -- Bold
        intensity = 'Bold',
        italic = false,
        font = wezterm.font({
            -- family = 'Monaspace Krypton',
            family = 'Monaspace Neon',
            -- weight='ExtraBold',
            weight = 'Bold',
        })
    },

    { -- Bold Italic
        intensity = 'Bold',
        italic = true,
        font = wezterm.font({
            family = 'Monaspace Xenon',
            style = 'Italic',
            weight = 'Bold',
        }
        )
    },
}
-- and finally, return the configuration to wezterm
return config
