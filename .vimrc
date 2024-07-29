" Initialize vim-plug plugin manager
call plug#begin('~/.vim/plugged')

" Plugin list
Plug 'preservim/nerdtree'               " NERDTree, a file system explorer
Plug 'vim-airline/vim-airline'          " Lean & mean status/tabline
Plug 'vim-airline/vim-airline-themes'   " Themes for vim-airline
Plug 'sainnhe/everforest'               " Everforest color scheme
Plug 'kaarmu/typst.vim'                 " Typst syntax

" Ensure plug#end is called to initialize the plugin system
call plug#end()
" Remember to run :PlugInstall in Vim to install the plugins

" General settings
set nocompatible              " Better default settings
filetype off                  " Required for vim-plug to work properly
set encoding=utf-8            " Set default encoding to utf-8
set clipboard^=unnamed,unnamedplus

" Interface settings
syntax enable                 " Enable syntax highlighting
set number                    " Show line numbers
set showcmd                   " Show (partial) command in the last line of the screen
set cursorline                " Highlight the current line
set wildmenu                  " Visual autocomplete for command menu
set lazyredraw                " Don't redraw while executing macros

" Tabs and spaces
set tabstop=4                 " Number of spaces that a <Tab> in the file counts for
set shiftwidth=4              " Number of spaces to use for each step of (auto)indent
set expandtab                 " Use spaces instead of tabs
set smarttab                  " Inserts tabs on the start of a line according to shiftwidth

" No junky files
set nobackup       " Do not create backup files
set nowritebackup  " Do not make a backup before overwriting a file
set noswapfile     " Do not create a swap file

" Remaps
"Smart way to move between windows
map <C-j> <C-W>
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
" Auto close
inoremap " ""<Esc>i
inoremap ' ''<Esc>i
inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap { {}<Esc>i

" Theme and color scheme
" Important!!
if has('termguicolors')
  set termguicolors
endif
set background=dark "before colorscheme
let g:everforest_background = 'hard' "before colorscheme
colorscheme everforest        " Set Everforest as the color scheme
let g:airline_theme='everforest' " Set Everforest as the vim-airline theme

" NERDTree settings
let g:NERDTreeWinSize=15
" Closing splits won't change NERDTree size.
set noequalalways
" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if winnr() == winnr('h') && bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

" Airline settings
let g:airline_section_a = ''
let g:airline_section_b = ''
let g:airline_section_c = ''
let g:airline_section_x = ''
let g:airline_section_y = ''
let g:airline_section_z = ''
let g:airline_section_a = airline#section#create(['mode'])
let g:airline_section_b = airline#section#create(['%t']) " switch t to f for no path
let g:airline_section_x = 'sammy 💩'
let g:airline_section_z = airline#section#create(['%{strftime("%a %d-%b-%Y %I:%M %p")}'])

