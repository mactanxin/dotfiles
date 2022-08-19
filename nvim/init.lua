-- basics
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
vim.cmd [[
  try
    colorscheme ayu
  catch /^Vim\%((\a\+)\)\=:E185/
    colorscheme default
    set background=dark
  endtry
]]
vim.cmd [[
  set fillchars+=diff:\ 
  hi CocSearch ctermfg=12 guifg=#18A3FF
  hi CocMenuSel ctermbg=109 guibg=#13354A
  " Highlight the symbol and its references when holding the cursor.
  autocmd CursorHold * silent call CocActionAsync('highlight')

if exists("g:loaded_webdevicons")
  call webdevicons#refresh()
endif

" use Tab
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"


]]

vim.cmd [[

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
]]

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
require("core.coc")
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
require('core.lightbulb')

local vim = vim
local execute = vim.api.nvim_command
local fn = vim.fn

require("telescope").load_extension("session-lens")
require('telescope').load_extension("notify")
require('telescope').load_extension("file_browser")

function coc_status_notify(msg, level)
  local notify_opts = { title = "LSP Status", timeout = 500, hide_from_history = true, on_close = reset_coc_status_record }
  -- if coc_status_record is not {} then add it to notify_opts to key called "replace"
  if coc_status_record ~= {} then
    notify_opts["replace"] = coc_status_record.id
  end
  coc_status_record = vim.notify(msg, level, notify_opts)
end

function reset_coc_status_record(window)
  coc_status_record = {}
end

local coc_diag_record = {}

function coc_diag_notify(msg, level)
  local notify_opts = { title = "LSP Diagnostics", timeout = 500, on_close = reset_coc_diag_record }
  -- if coc_diag_record is not {} then add it to notify_opts to key called "replace"
  if coc_diag_record ~= {} then
    notify_opts["replace"] = coc_diag_record.id
  end
  coc_diag_record = vim.notify(msg, level, notify_opts)
end

function reset_coc_diag_record(window)
  coc_diag_record = {}
end

function coc_notify(msg, level)
  local notify_opts = { title = "LSP Message", timeout = 500 }
  vim.notify(msg, level, notify_opts)
end
