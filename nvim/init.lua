-- basics
require("core.impatient")
vim.cmd("set nocompatible")
vim.cmd("syntax on")
vim.cmd("filetype plugin indent on")
vim.cmd("set foldmethod=indent")
vim.cmd("set ruler")
vim.cmd("nohlsearch")
vim.cmd("set statusline+=%F")
vim.cmd("set autochdir")
-- vim.cmd("set autoreload")
vim.cmd("set nofoldenable")
vim.cmd("colorscheme ayu")
vim.cmd("let ayucolor='mirage'")
vim.cmd([[
  try
    colorscheme ayu
  catch /^Vim\%((\a\+)\)\=:E185/
    colorscheme default
    set background=dark
  endtry
]])
vim.cmd([[
  set fillchars+=diff:\ 

if exists("g:loaded_webdevicons")
  call webdevicons#refresh()
endif
]])

vim.cmd([[

"*****************************************************************************
"" Abbreviations
"*****************************************************************************
"" no one is really happy until you have this shortcuts

cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall
]])

vim.cmd("let g:auto_session_enabled = v:false")
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
vim.g.cursorhold_updatetime = 100
-- use emmet
vim.g.user_emmet_mode = "a"
-- vim.g.rooter_patterns = ['.git', 'package.json', 'yarn.lock']
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
require("core.notify")
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
require("core.goto-preview")
require("core.custom-vim-functions")
require("core.lightbulb")
require("core.tabline")
require("core.lsp-status")
require("core.null-ls")
require("core.shade")

local vim = vim
local execute = vim.api.nvim_command
local fn = vim.fn

require("telescope").load_extension("session-lens")
require("telescope").load_extension("notify")
require("telescope").load_extension("file_browser")
