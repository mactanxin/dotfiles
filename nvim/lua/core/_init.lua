-- basics
vim.cmd("set nocompatible")
vim.cmd("syntax on")
vim.cmd("filetype plugin indent on")
vim.cmd("set foldmethod=indent")
vim.cmd("set ruler")
vim.cmd("nohlsearch")
vim.cmd("set statusline+=%F")
vim.cmd("set autochdir")
vim.cmd("set nofoldenable")
vim.cmd("colorscheme ayu")
vim.cmd("let ayucolor='mirage'")
vim.cmd [[
	try
		colorscheme ayu
	catch /^Vim\%((\a\+)\)\=:E185/
	  colorscheme default
	  set background=dark
	endtry
]]
-- disable some useless standard plugins to save startup time
-- these features have been better covered by plugins
vim.g.loaded_matchparen = 1
vim.g.loaded_matchit = 1
vim.g.loaded_logiPat = 1
vim.g.loaded_rrhelper = 1
vim.g.loaded_tarPlugin = 1
vim.g.loaded_gzip = 1
vim.g.loaded_zipPlugin = 1
vim.g.loaded_2html_plugin = 1
vim.g.loaded_shada_plugin = 1
vim.g.loaded_spellfile_plugin = 1
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_tutor_mode_plugin = 1
vim.g.loaded_remote_plugins = 1
vim.g.airline_powerline_fonts = 1
require("core.options")
require("core.keymaps")
require("core.theme")
require("core.plugins")
require("core.treesitter")
require("core.toggleterm")
require("core.colorizer")
require("core.comment")
require("core.autopairs")
require("core.showMessage")
require("core.notify")
require("core.startup-screen")
require("core.neo-tree")
require("core.bufferline")
require("core.diffview")
require("core.lspconfig")
require("core.symbols-outline")
require("core.gitsigns")
-- require("core.pretty-fold")
-- require("core.null-ls")
-- require("core.size-matters")
-- require("core.nvimtree")

local vim = vim
local execute = vim.api.nvim_command
local fn = vim.fn

require("telescope").load_extension("session-lens")
require('telescope').load_extension("notify")
require('telescope').load_extension("file_browser")
