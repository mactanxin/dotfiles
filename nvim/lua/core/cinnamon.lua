local status_ok, cinnamon = pcall(require, "cinnamon")
if not status_ok then
	return
end

cinnamon.setup({
	-- KEYMAPS:
	default_keymaps = true, -- Create default keymaps.
	extra_keymaps = false, -- Create extra keymaps.
	extended_keymaps = false, -- Create extended keymaps.
	override_keymaps = false, -- The plugin keymaps will override any existing keymaps.

	-- OPTIONS:
	always_scroll = false, -- Scroll the cursor even when the window hasn't scrolled.
})
