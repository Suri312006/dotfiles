local wezterm = require 'wezterm'

local module = {}



function module.apply_to_config(config)
    config.font_size = 10.3;
    config.warn_about_missing_glyphs = true
    config.freetype_load_target =
    'HorizontalLcd' -- https://wezfurlong.org/wezterm/config/lua/config/freetype_load_target.html
    config.font = wezterm.font(
        {           -- Normal text
            family = 'Monaspace Krypton',
            -- family = 'Monaspace Argon',
                harfbuzz_features = { 'calt', 'clig' ,'liga', 'dlig', 'ss01', 'ss02', 'ss03', 'ss04', 'ss05', 'ss06', 'ss07', 'ss08' },
            stretch = 'UltraCondensed', -- This doesn't seem to do anything
            weight = 'DemiBold',
        })

    config.font_rules = {
        {
             -- Italic
            intensity = 'Bold',
            italic = true,
            font = wezterm.font({
                family="Monaspace Radon",  -- script style
                -- family = 'Monaspace Argon', -- courier-like
                -- family = 'Monaspace Krypton', -- courier-like
                style = 'Italic',
                harfbuzz_features = { 'calt', 'clig' ,'liga', 'dlig', 'ss01', 'ss02', 'ss03', 'ss04', 'ss05', 'ss06', 'ss07', 'ss08' },
                weight = 'Medium'
            })
        },

        { -- Bold
            intensity = 'Bold',
            italic = false,
            font = wezterm.font({
                -- family = 'Monaspace Krypton',
                family = 'Monaspace Neon',
                -- weight='ExtraBold',
            harfbuzz_features = { 'calt', 'liga', 'dlig', 'ss01', 'ss02', 'ss03', 'ss04', 'ss05', 'ss06', 'ss07', 'ss08' },
                weight = 'Bold',
            })
        },

        { -- Bold Italic
            intensity = 'Bold',
            italic = true,
            font = wezterm.font({
                family = 'Monaspace Xenon',
                style = 'Italic',
                weight = 'Medium',
            harfbuzz_features = { 'calt', 'liga', 'dlig', 'ss01', 'ss02', 'ss03', 'ss04', 'ss05', 'ss06', 'ss07', 'ss08' },
            }
            )
        },
    }
end

return module
