local impatient_ok, impatient = pcall(require, "impatient")
if impatient_ok then
	impatient.enable_profile()
end
require("core.globals")
require("core.ayu")
require("core.options")
require("core.keymaps")
require("core.nvim-cmp")
require("core.plugins")
require("core.startup-screen")
require("core.dashboard")
require("core.lspconfig")
require("core.lsp-status")
require("core.null-ls")
require("core.lspsaga")
require("core.utils")

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
