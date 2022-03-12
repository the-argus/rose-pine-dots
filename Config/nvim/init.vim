

"automated installation of vimplug if not installed
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
    silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source ~/.config/nvim/init.vim
endif

" PLUGINS --------------------------

call plug#begin('~/.config/nvim/plugged')

" completion plugin
Plug 'neoclide/coc.nvim', { 'branch': 'release' }

" GLSL syntax
Plug 'tikhomirov/vim-glsl'

" GLSLviewer
Plug 'timtro/glslView-nvim', { 'ft': 'glsl' }

" fuzzy finder
Plug 'kien/ctrlp.vim'

" fancy file tree
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdtree'

" git integration
Plug 'tpope/vim-fugitive'
Plug 'Xuyuanp/nerdtree-git-plugin'

" statusbar
Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'

" comment block
Plug 'preservim/nerdcommenter'

call plug#end()

" NEOVIDE --------------------------
let g:neovide_cursor_animation_length=0.13
let g:neovide_cursor_trail_length=0.8
let g:neovide_cursor_vfx_mode = "railgun"

" KEYBINDINGS ----------------------

" leader
map <SPACE> <leader>

" autocomplete with tab
inoremap <silent><expr> <tab> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<TAB>"
inoremap <silent><expr> <cr> "\<c-g>u\<CR>"

" toggle nerdtree
nnoremap <leader>e :NERDTreeFocus<bar>NERDTreeRefreshRoot<CR>
nnoremap <leader>f :NERDTreeClose<CR>

" To open a new empty buffer
" This replaces :tabnew which I used to bind to this mapping
nmap <leader>t :enew<CR>

" Move to the next buffer
noremap <S-k> :bnext<CR>

" Move to the previous buffer
noremap <S-j> :bprevious<CR>

" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
" noremap <S-x> :bd<CR>
noremap <S-x> :bp<bar>sp<bar>bn<bar>bd<CR>

" comment out selection
vmap / <Plug>NERDCommenterToggle('n', 'Toggle')<Cr>

" CONFIG ---------------------------

" airline buffers --

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'
" move airline to the top
" let g:airline_statusline_ontop=1
" add powerline symbols to g:airline_symbols
let g:airline_powerline_fonts = 1

" skip regular utf-8 encoding
let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'



" let g:airline#extensions#tabline#left_sep = ' '
" let g:airline#extensions#tabline#left_alt_sep = '|'
" let g:airline#extensions#tabline#right_sep = ' '
" let g:airline#extensions#tabline#right_alt_sep = '|'
" let g:airline_left_alt_sep = '   '
" let g:airline_right_alt_sep = '   '
" let g:airline_right_sep = "░▒▓"
" let g:airline_left_sep = "▓▒░"
let g:airline_left_alt_sep = ' '
let g:airline_right_alt_sep = ' '
let g:airline_right_sep = ""
let g:airline_left_sep = ""
" let g:airline_inactive_collapse = 1

" nerd commenter -------
let g:NERDCreateDefaultMappings = 1
let g:NERDSpaceDelims = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDToggleCheckAllLines = 1

" nerd git status ------
let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'✹',
                \ 'Staged'    :'✚',
                \ 'Untracked' :'✭',
                \ 'Renamed'   :'➜',
                \ 'Unmerged'  :'═',
                \ 'Deleted'   :'✖',
                \ 'Dirty'     :'!',
                \ 'Ignored'   :'☒',
                \ 'Clean'     :'✔︎',
                \ 'Unknown'   :'?',
                \ }

" GLSL syntax highlighting
autocmd! BufNewFile,BufRead *.vs,*.fs set ft=glsl

syntax on
syntax enable

let base16colorspace=256

" remember cursor position
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

set nocompatible            " disable compatibility to old-time vi
set showmatch               " show matching 

" buffers can be hidden if modified
set hidden

" More natural splits
set splitbelow          " Horizontal split below current.
set splitright          " Vertical split to right of current.


set spelllang=en
set spellsuggest=best,3
set ignorecase              " case insensitive 
set smartcase
set gdefault
" set mouse=v                 " middle-click paste with 
set hlsearch                " highlight search 
set incsearch               " incremental search
set tabstop=4               " number of columns occupied by a tab 
set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set shiftwidth=4            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed
set number                  " add line numbers
set wildmode=longest,list   " get bash-like tab completions
set cc=80                  " set an 80 column border for good coding style
filetype plugin indent on   "allow auto-indenting depending on file type
syntax on                   " syntax highlighting
" set mouse=a                 " enable mouse click
set clipboard=unnamedplus   " using system clipboard
filetype plugin on
set cursorline              " highlight current cursorline
hi CursorLine ctermbg=240 cterm=NONE gui=NONE
hi CursorLineNr ctermbg=240 cterm=NONE gui=NONE
highlight Comment cterm=italic
highlight Comment gui=italic
set guifont=VictorMono\ Nerd\ Font:h12

set ttyfast                 " Speed up scrolling in Vim
" set spell                 " enable spell check (may need to download language package)
" set noswapfile            " disable creating swap file
" set backupdir=~/.cache/vim " Directory to store backup files.
