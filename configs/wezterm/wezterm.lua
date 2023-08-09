-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This table will hold the configuration.
local config = {}


-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
    config = wezterm.config_builder()
end

-- This is where you actually apply your config choices

-- Font configs
config.font = wezterm.font {
    family = 'JetBrainsMono Nerd Font Mono',
    harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' },
}
config.font_size = 10.0
-- config.force_reverse_video_cursor = true
-- config.bold_brightens_ansi_colors = true

-- Color configs
config.color_scheme = 'GruvboxDark'
config.bold_brightens_ansi_colors = "BrightAndBold"
config.window_background_opacity = 0.97

-- Other configs
config.enable_tab_bar = false
config.window_padding = {
    left = 2,
    right = 2,
    top = 0,
    bottom = 0,
}

-- and finally, return the configuration to wezterm
return config
