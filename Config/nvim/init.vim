

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

" fuzzy finder
" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
" Plug 'junegunn/fzf.vim'

" automatic bracket pairs
" Plug 'jiangmiao/auto-pairs'
" Plug 'machakann/vim-sandwich'

" fancy file tree
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdtree'

" statusbar
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'

" 16 color support for vim
" Plug 'chriskempson/base16-vim'

" indentation line
" Plug 'Yggdroot/indentLine'

" formatter
" Plug 'Chiel92/vim-autoformat'

" C++ syntax highlighting
" Plug 'jackguo380/vim-lsp-cxx-highlight'
" C++ linting
" Plug 'vim-syntastic/syntastic'

call plug#end()

" KEYBINDINGS ----------------------
" change tabs easily
noremap <S-j> :tabp<return>
noremap <S-k> :tabn<return>

" beginning and end of line
nmap <S-e> $<right>
nmap <S-a> 0
imap <C-e> <esc>$i<right>
imap <C-a> <esc>0i

" CONFIG ---------------------------

" c++ syntax highlighting
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1

let g:syntastic_cpp_checkers = ['cpplint']
let g:syntastic_c_checkers = ['cpplint']
let g:syntastic_cpp_cpplint_exec = 'cpplint'

let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1

noremap <F3> :Autoformat<CR>

map ; :Files<CR>

syntax on
syntax enable

let base16colorspace=256




set nocompatible            " disable compatibility to old-time vi
set showmatch               " show matching 
set ignorecase              " case insensitive 
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
" set clipboard=unnamedplus   " using system clipboard
filetype plugin on
set cursorline              " highlight current cursorline
hi CursorLine ctermbg=240 cterm=NONE gui=NONE
hi CursorLineNr ctermbg=240 cterm=NONE gui=NONE
set ttyfast                 " Speed up scrolling in Vim
" set spell                 " enable spell check (may need to download language package)
" set noswapfile            " disable creating swap file
" set backupdir=~/.cache/vim " Directory to store backup files.
