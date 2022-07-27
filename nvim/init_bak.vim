" let mapleader=" "

" map s <nop>
" noremap S :w<CR> 
" map Q :q<CR>
" map R :source $MYVIMRC<CR>
" noremap cd :chdir 

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction


" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
" nmap <silent> [g <Plug>(coc-diagnostic-prev)
" nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
" nmap <silent> gd <Plug>(coc-definition)
" nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
" nmap <silent> gr <Plug>(coc-references)

nnoremap <LEADER>m :call mkdir(expand("%:p:h"), "p")<CR>


call plug#begin()
Plug 'ryanoasis/vim-devicons'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'wellle/context.vim'
" Plug 'nvim-treesitter/nvim-treesitter-context'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Easier for telescope
Plug 'airblade/vim-rooter'
Plug 'mhinz/vim-startify'
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'majutsushi/tagbar', { 'on': 'TagbarOpenAutoClose' }
Plug 'evanleck/vim-svelte', {'branch': 'main'}
Plug 'w0rp/ale' "   Error Checking
" fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Auto Complete
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" easy align
Plug 'junegunn/vim-easy-align'
" Ayu
Plug 'ayu-theme/ayu-vim'
" HTML, CSS, JavaScript, PHP, JSON, etc.
Plug 'elzr/vim-json'
Plug 'othree/html5.vim'
Plug 'hail2u/vim-css3-syntax'
" Plug 'gko/viml-coloresque', { 'for': ['vim-plug', 'html', 'javascript', 'css', 'less', 'vue', 'svelte'] }
Plug 'pangloss/vim-javascript', { 'for' :['javascript', 'vim-plug'] }
Plug 'mattn/emmet-vim'
" tailwind
Plug 'rodrigore/coc-tailwind-intellisense', {'do': 'npm install'}
" Git Signs
Plug 'lewis6991/gitsigns.nvim'
" Git
Plug 'tpope/vim-fugitive'

" Ctrl P
Plug 'ctrlpvim/ctrlp.vim'

"Telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'norcalli/nvim-colorizer.lua'
Plug 'APZelos/blamer.nvim'



" Easy Motion
Plug 'easymotion/vim-easymotion'

" SearchBox
Plug 'MunifTanjim/nui.nvim'
Plug 'VonHeikemen/searchbox.nvim'

call plug#end()


if exists("g:loaded_webdevicons")
  call webdevicons#refresh()
endif

function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd FileType nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd FileType nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('ts', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')
call NERDTreeHighlightFile('ds_store', 'Gray', 'none', '#686868', '#151515')
call NERDTreeHighlightFile('gitconfig', 'Gray', 'none', '#686868', '#151515')
call NERDTreeHighlightFile('gitignore', 'Gray', 'none', '#686868', '#151515')
call NERDTreeHighlightFile('bashrc', 'Gray', 'none', '#686868', '#151515')
call NERDTreeHighlightFile('bashprofile', 'Gray', 'none', '#686868', '#151515')

let g:webdevicons_enable_startify = 1

let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }

" map tt :NERDTreeToggle<CR>
" map tt :NvimTreeToggle<CR>
" nnoremap <LEADER>r :NvimTreeRefresh<CR>
" nnoremap <LEADER>f :NvimTreeFindFile<CR>

let NERDTreeMapOpenExpl = ""
let NERDTreeMapUpdir = ""
let NERDTreeMapUpdirKeepOpen = "l"
let NERDTreeMapOpenSplit = ""
let NERDTreeOpenVSplit = ""
let NERDTreeMapActivateNode = "i"
let NERDTreeMapOpenInTab = "o"
let NERDTreeMapPreview = ""
let NERDTreeMapCloseDir = "n"
let NERDTreeMapChangeRoot = "y"
function! s:gitModified()
    let files = systemlist('git ls-files -m 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

" same as above, but show untracked files, honouring .gitignore
function! s:gitUntracked()
    let files = systemlist('git ls-files -o --exclude-standard 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

let g:startify_lists = [
        \ { 'type': 'files',     'header': ['   MRU']            },
        \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
        \ { 'type': 'sessions',  'header': ['   Sessions']       },
        \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
        \ { 'type': function('s:gitModified'),  'header': ['   git modified']},
        \ { 'type': function('s:gitUntracked'), 'header': ['   git untracked']},
        \ { 'type': 'commands',  'header': ['   Commands']       },
        \ ]

" let g:startify_bookmarks = systemlist("cut -sd' ' -f 2- ~/.NERDTreeBookmarks")

let g:startify_custom_header =
      \ startify#pad(split(system('figlet -f ~/.config/fonts/3D-ASCII.flf -w 85 NeoVIM '), '\n'))
let g:startify_session_dir = '~/.config/nvim/session'
let g:startify_bookmarks = [ 
      \ {'c': '~/.zshrc'},
      \ {'i': '~/.config/nvim/init.vim' },
      \ {'l': '~/.config/nvim/lua/core/_init.lua' },
      \ '~/Workspace/Ailink/code' ,
      \ '~/Workspace/code' ,
      \ ]

let entry_format = "'   ['. index .']'. repeat(' ', (3 - strlen(index)))"

if exists('*WebDevIconsGetFileTypeSymbol')  " support for vim-devicons
  let entry_format .= ". WebDevIconsGetFileTypeSymbol(entry_path) .' '.  entry_path"
else
  let entry_format .= '. entry_path'
endif

function! StartifyEntryFormat()
return 'WebDevIconsGetFileTypeSymbol(absolute_path) ." ". entry_path'
endfunction

set sessionoptions-=blank
set termguicolors
set encoding=UTF-8
" Neovide Specifice settings
set guifont=MesloLGS\ NF:h16
let g:neovide_cursor_vfx_mode = "railgun"
let ayucolor="mirage" " for mirage version of theme
colorscheme ayu

set nocompatible
syntax on
filetype on
set foldmethod=indent
set nofoldenable
" set autochdir
" in case the prior line isn't working
autocmd BufEnter * silent! lcd %:p:h
" " Start NERDTree and put the cursor back in the other window.
" autocmd VimEnter * NERDTree | wincmd p
" " Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" autocmd BufWinEnter * NERDTreeMirror
" aslo print out current working folder path
" nnoremap <LEADER>cd :cd %:p:h<CR>:pwd<CR>
" nnoremap <LEADER>ss :SSave<CR>
" nnoremap <LEADER>sl :SLoad<CR>


set number
set relativenumber
set wildmenu
set showcmd
set hlsearch
exec "nohlsearch" 
set incsearch
set ignorecase
set smartcase
" set indent
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set autoindent
set smartindent
set statusline+=%F
"  enable line and column display
set ruler


" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Go to tab by number
" noremap <LEADER>1 1gt
" noremap <LEADER>2 2gt
" noremap <LEADER>3 3gt
" noremap <LEADER>4 4gt
" noremap <LEADER>5 5gt
" noremap <LEADER>6 6gt
" noremap <LEADER>7 7gt
" noremap <LEADER>8 8gt
" noremap <LEADER>9 9gt
" noremap <LEADER>0 :tablast<cr>
"
" noremap <LEADER><CR> :nohlsearch<CR>
" noremap ; :

"Improved keyboard shortcut
" map sl :set splitright<CR>:vsplit<CR>
" map sh :set nosplitright<CR>:vsplit<CR>
" map sk :set splitbelow<CR>:split<CR>
" map sj :set splitbelow<CR>:split<CR>

" resize current buffer by +/- 5 using `ALT`
" nnoremap <M-left> :vertical resize -5<cr>
" nnoremap <M-down> :resize +5<cr>
" nnoremap <M-up> :resize -5<cr>
" nnoremap <M-right> :vertical resize +5<cr>

" map <leader>l <C-w>l
" map <leader>h <C-w>h
" map <leader>j <C-w>j
" map <leader>k <C-w>k
" map <leader><leader> <C-f>
" map <leader>bb <C-b>

" map <LEADER>sv <C-w>t<C-w>H
" map <LEADER>sh <C-w>t<C-w>K

" map tn :tabe<CR>
" map th :-tabnext<CR>
" map tl :+tabnext<CR>


xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
" Find files using Telescope command-line sugar.
" nnoremap ;ff <cmd>Telescope find_files<cr>
" nnoremap ;fg <cmd>Telescope live_grep<cr>
" nnoremap ;fb <cmd>Telescope buffers<cr>
" nnoremap ;fh <cmd>Telescope help_tags<cr>
" nnoremap ;pp :lua require'telescope.builtin'.planets{}<CR>
" nnoremap ;fs <cmd>Telescope session-lens sesarch_session<cr>
" nmap ;fs :lua require('session-lens').search_session()<CR>


" CtrlP mapping
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

let g:user_emmet_mode="a"

"Rooter config
let g:rooter_patterns = ['.git', 'package.json', 'yarn.lock']

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:auto_session_enabled = v:false

" EasyMotion Key Bindings
map s <Plug>(easymotion-bd-f)


" SjarchBox Key Bindings
nnoremap <LEADER>s :SearchBoxIncSearch<CR>
nnoremap <LEADER>r :SearchBoxReplace confirm=menu<CR>

vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

"jGit Lens Blamer
let g:blamer_enabled = 1
lua <<EOF
require('core._init')
EOF
