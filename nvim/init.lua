local impatient_ok, impatient = pcall(require, "impatient")
if impatient_ok then
	impatient.enable_profile()
end

require("core.globals")
require("core.ayu")
require("core.options")
require("core.keymaps")
require("core.nvim-cmp")
require("core.theme")
require("core.plugins")
require("core.treesitter")
require("core.toggleterm")
require("core.colorizer")
require("core.comment")
require("core.cinnamon")
require("core.autopairs")
require("core.showMessage")
require("core.startup-screen")
require("core.dashboard")
require("core.neo-tree")
require("core.bufferline")
require("core.lualine")
require("core.diffview")
require("core.lspconfig")
require("core.symbols-outline")
require("core.gitsigns")
require("core.peepsight")
require("core.blankline")
--[[ require("core.goto-preview") ]]
require("core.custom-vim-functions")
require("core.lightbulb")
require("core.tabline")
require("core.lsp-status")
require("core.null-ls")
--[[ require("core.modes") ]]
require("core.minimap")
require("core.lspsaga")
require("core.neodim")
require("core.autotag")
require("core.utils")
--[[ require("core.shade") ]]

local vim = vim
local execute = vim.api.nvim_command
local fn = vim.fn

require("telescope").load_extension("session-lens")
require("telescope").load_extension("notify")
require("telescope").load_extension("file_browser")

vim.api.nvim_create_autocmd("BufWritePost", {
	group = vim.api.nvim_create_augroup("PACKER", { clear = true }),
	pattern = "plugins.lua",
	command = "source <afile> | PackerCompile",
})
