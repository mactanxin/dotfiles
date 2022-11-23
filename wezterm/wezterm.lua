local wezterm = require("wezterm")

return {
	color_scheme = "ayu",
	font_size = 20.0,
	font = wezterm.font("Fira Code"),
	-- You can specify some parameters to influence the font selection;
	-- for example, this selects a Bold, Italic font variant.
	font = wezterm.font("JetBrains Mono", { weight = "Bold", italic = true }),
	leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1000 },
	keys = {
		-- This will create a new split and run your default program inside it
		{
			key = "|",
			mods = "CTRL|SHIFT",
			action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
		},
		{
			key = "-",
			mods = "CTRL|SHIFT",
			action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
		},
	},
}
