set nocompatible              " be iMproved, required

set lines=999 columns=9999

set guifont=Source\ Code\ Pro

" Line Numbers
set nu

" Highlight Search
set hlsearch

"Set autoindent
set autoindent

" Expand tab
set expandtab

" Auto load files that have changed
set autoread

" Tab spacing
set ts=4 sw=4 sts=4
set colorcolumn=120
set shell=/bin/zsh
set cursorline
set noswapfile

"Show Ruler
set ruler

filetype plugin indent on    " required

syntax enable
" Status Line Format
" set laststatus=2
" set statusline=%<%f\               
" set statusline+=\ [%{getcwd()}]            
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
" set statusline+=%=%-14.(%l,%c%V%)\ %p%%

" Python syntax
" let python_highlight_all = 1

" Map leader to space
let mapleader="\<Space>"

" Dont ask to load ycm config every time Vim opens
let g:ycm_confirm_extra_conf = 0

" Vundle ======================================================
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Snippets
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "garbas/vim-snipmate"
Bundle "honza/vim-snippets"
Bundle "scrooloose/nerdtree"

" Paredit
Bundle 'vim-scripts/paredit.vim'

" Emmet
Plugin 'mattn/emmet-vim'

" JSX Syntax Highlighting
Plugin 'mxw/vim-jsx'

" Ctrl P for fuzzy file search
Plugin 'ctrlp.vim'

" Base 16 theme
Plugin 'chriskempson/base16-vim'

" You Complete Me
Plugin 'Valloric/YouCompleteMe'

" Vim Clang Format
Plugin 'rhysd/vim-clang-format'

" Vim Bbye for sane buffer closing
Plugin 'moll/vim-bbye'

" C++ Enhanced Syntax
Plugin 'octol/vim-cpp-enhanced-highlight'

" Fugitive Git
Plugin 'tpope/vim-fugitive.git'

" Commentary for comments
Plugin 'tpope/vim-commentary'

" Syntastic
Plugin 'scrooloose/syntastic.git'

"Git Gutter
Plugin 'airblade/vim-gitgutter'

" Javascript Syntax
Bundle "pangloss/vim-javascript"

" Airline
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" Ack
Plugin 'mileszs/ack.vim'

" Flake8
Plugin 'nvie/vim-flake8'

" Change trigger for Emmet to tab
imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")

" Map Shift-Enter to Escape
:inoremap <S-CR> <Esc>

" Toggle between header and body files (C/C++)
nmap <F1> :if expand('%:e')=='hh'<CR>e %:r.cc<CR>else<CR>e %:r.hh<CR>endif<CR><CR>

" Map Ctrl-N to open nerd tree
map <C-n> :NERDTreeToggle<CR>

" Map Ctrl-c to copy a line in visual mode (vnoremap)
vnoremap <C-c> "+yy

" Map ; to open Ctrl P buffer
nnoremap ; :CtrlP<CR>

" Leader Mappings -----------------------------------
" Leader'vimrc' opens the vimrc file
map <leader>vimrc :e ~/.vimrc<CR>

" Find the current buffer in NERDTree
map <leader>r :NERDTreeFind<cr>

" All of your Plugins must be added before the following line
call vundle#end()            " required

" Variables -----------------------------------------
" JSX
let g:jsx_ext_required = 0

" NERDTree flags
let g:NERDTreeWinSize = 50 " Width of NERDTree
let g:NERDTreeShowHidden = 1 " Show hidden files

" let javascript_enable_domhtmlcss=1

" vim-clang-format values
" Help the plugin find the specific version of clang-format installed
" Alternatively, create a symlink to this from 'usr/bin/clang-format'
let g:clang_format#command="clang-format-3.6"

"Auto detect the clang format file in the ATC repo
let g:clang_format#detect_style_file=1

" Automatically set the formatexpr in vim so the "gg" and "q" functions work
" to trigger formatting
let g:clang_format#auto_formatexpr=1

" Dont let YCM register as a syntastic checker
let g:ycm_register_as_syntastic_checker = 0

" Syntastic Flags
let g:syntastic_cpp_checkers=['gcc']
let g:syntastic_enable_signs=1
let g:syntastic_mode_map = {'mode': 'active',
    \ 'active_filetypes': [],
    \ 'passive_filetypes': ["java"] }
let g:syntastic_cpp_include_dirs = ['source']
let g:syntastic_cpp_compiler_options=' -std=c++11'
let g:syntastic_cpp_compiler = 'clang++-3.5'
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_python_checkers=["flake8"]
let g:syntastic_javascript_checkers=['eslint']

" Ctrlp flags
set wildignore+=*/bin/*
set wildignore+=*/build/*
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
let g:ctrlp_dotfiles = 0
let g:ctrlp_switch_buffer = 0
let g:ctrlp_custom_ignore ='\v\~$|\.(o|swp|pyc|wav|mp3|ogg|blend|so|jar)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])|__init__\.py|CMakeFiles\CMakeCache\.txt$|cmake_install\.cmake$'

" Flake8 Flags
let g:flake8_show_in_gutter=1

colorscheme base16-atelierheath

" Airline Theme
let g:airline_theme = "powerlineish"

" Alternate colors and highlighting --------------------------
:hi Search ctermfg=020 ctermbg=026 guifg=#ff0000 guibg=#cccccc

" Color the non-text lines the same as the background
:hi NonText guifg=fg guibg=bg

" Color the colorcolumn bar
:hi ColorColumn guibg=#ededed
:hi CursorLine guibg=#ededed
