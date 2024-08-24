local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.color_scheme = "Catppuccin Mocha"

config.font = wezterm.font("MesloLGS NF")
config.harfbuzz_features = {}
config.font_size = 14
config.freetype_load_flags = "NO_HINTING"

config.window_decorations = "RESIZE"

config.enable_tab_bar = false

config.initial_rows = 40
config.initial_cols = 140

-- config.window_background_opacity = 0.95
-- config.macos_window_background_blur = 10

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
