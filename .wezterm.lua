-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.color_scheme = "Tokyo Night"
config.font = wezterm.font({
	family = "MonaspiceNe Nerd Font Propo", -- Proportinal
	-- 0 to disable
	harfbuzz_features = {
		-- "calt=0",
		-- "clig=0",
		-- "liga=0",
	},
})

config.scrollback_lines = 25000
config.max_fps = 120

-- enable scrollbar
config.enable_scroll_bar = true

-- tabs
config.tab_max_width = 32
config.tab_bar_at_bottom = false
config.hide_tab_bar_if_only_one_tab = true

-- window
config.window_decorations = "RESIZE"

-- bell
config.visual_bell = {
	-- fade_in_function = "EaseIn",
	fade_in_duration_ms = 25,
	-- fade_out_function = "EaseOut",
	fade_out_duration_ms = 175,
}
config.colors = {
	visual_bell = "#254070",
}

-- and finally, return the configuration to wezterm
return config
