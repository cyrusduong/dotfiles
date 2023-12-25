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
	family = "MonaspiceNe Nerd Font Mono", -- Proportinal
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

-- open url with CTRL+P
config.keys = {
	{
		key = "O",
		mods = "CTRL",
		action = wezterm.action.QuickSelectArgs({
			label = "open url",
			patterns = {
				"https?://\\S+",
			},
			action = wezterm.action_callback(function(window, pane)
				local url = window:get_selection_text_for_pane(pane)
				wezterm.log_info("opening: " .. url)
				wezterm.open_with(url)
			end),
		}),
	},
}

-- Set the cursor style
-- Acceptable values are SteadyBlock, BlinkingBlock, SteadyUnderline,
-- BlinkingUnderline, SteadyBar, and BlinkingBar.
config.default_cursor_style = "BlinkingUnderline"
config.cursor_blink_rate = 500
config.cursor_blink_ease_in = "Linear"
config.cursor_blink_ease_out = "Linear"

-- make ECOMM-xxxx task links clickable and open JIRA with them.
-- sauce: https://wezfurlong.org/wezterm/hyperlinks.html#implicit-hyperlinks
-- default rules
config.hyperlink_rules = wezterm.default_hyperlink_rules()
-- the first matched regex group is captured in $1 (1-indexed)
table.insert(config.hyperlink_rules, {
	regex = [[ECOMM\-(\d+)]],
	format = "https://caesarsdevelopment.atlassian.net/browse/ECOMM-$1",
})

-- and finally, return the configuration to wezterm
return config
