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

-- For example, changing the color scheme:
config.font = wezterm.font {
    family = 'JetBrainsMono Nerd Font Mono',
    harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' },
}
config.color_scheme = 'GruvboxDark'

-- Other configs
config.enable_tab_bar = false
config.bold_brightens_ansi_colors = "BrightAndBold"
config.window_background_opacity = 0.97

-- and finally, return the configuration to wezterm
return config
