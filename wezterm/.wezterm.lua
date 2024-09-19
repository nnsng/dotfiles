local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.color_scheme = "Catppuccin Mocha"

-- config.font = wezterm.font("MesloLGS NF")
config.font = wezterm.font("JetBrainsMono Nerd Font Mono")
config.font_size = 14
config.harfbuzz_features = { "zero", "cv11", "cv12" }

config.window_decorations = "RESIZE"

config.enable_tab_bar = false

config.initial_rows = 40
config.initial_cols = 140

-- config.window_background_opacity = 0.95
-- config.macos_window_background_blur = 30

config.keys = {
	{
		key = "LeftArrow",
		mods = "OPT",
		action = wezterm.action.SendString("\x1bb"),
	},
	{
		key = "RightArrow",
		mods = "OPT",
		action = wezterm.action.SendString("\x1bf"),
	},
	{
		key = "'",
		mods = "CTRL",
		action = wezterm.action.ClearScrollback("ScrollbackAndViewport"),
	},
}

config.mouse_bindings = {
	-- Ctrl-click will open the link under the mouse cursor
	{
		event = { Up = { streak = 1, button = "Left" } },
		mods = "CTRL",
		action = wezterm.action.OpenLinkAtMouseCursor,
	},
}

return config
