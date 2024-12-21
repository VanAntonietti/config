-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = "Catppuccin Frappe"

-- Font Configuration
config.font = wezterm.font("FiraCode Nerd Font")

-- Remove Tittle Bar
-- config.window_decorations = "RESIZE"
config.window_decorations = "INTEGRATED_BUTTONS | RESIZE"

-- Remove tab bar if only one tab is active
config.hide_tab_bar_if_only_one_tab = true

-- Remove close confirmation
config.window_close_confirmation = "NeverPrompt"

-- Increase window size
config.initial_rows = 64
config.initial_cols = 194

-- Change cursor style
config.default_cursor_style = "SteadyBar"

-- Padding
local i = 42
local j = 21
config.window_padding = {
	left = j,
	right = j,
	top = i,
	bottom = j,
}

-- and finally, return the configuration to wezterm
return config
