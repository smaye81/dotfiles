set nocompatible              " be iMproved, required
" Load color scheme
"if has("gui_running")
	" set background=dark
"	colorscheme base16-default
"else
"	colorscheme stonewashed-256
"endif

set lines=999 columns=9999

set guifont=Source\ Code\ Pro

" Line Numbers
set nu

"Set autoindent
set autoindent

" Expand tab
set expandtab

" Tab spacing
set ts=4 sw=4 sts=4

" Status Line Format
" set laststatus=2
" set statusline=%<%f\               
" set statusline+=\ [%{getcwd()}]            
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
" set statusline+=%=%-14.(%l,%c%V%)\ %p%%

"Show Ruler
set ruler

" Width of the NERDTree
let g:NERDTreeWinSize = 50

" Map leader to space
let mapleader="\<Space>"

" Dont ask to load ycm config every time Vim opens
let g:ycm_confirm_extra_conf = 0

" Color the non-text lines the same as the background
:hi NonText guifg=fg guibg=bg

" Vundle ======================================================
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

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

" Change trigger for Emmet to tab
imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")

" Map Shift-Enter to Escape
:inoremap <S-CR> <Esc>

" Map Ctrl-N to open nerd tree
map <C-n> :NERDTreeToggle<CR>

" Map Ctrl-c to copy a line in visual mode (vnoremap)
vnoremap <C-c> "+yy

" Map ; to open Ctrl P buffer
nnoremap ; :CtrlP<CR>

" Leader'vimrc' opens the vimrc file
map <leader>vimrc :e ~/.vimrc<CR>

let javascript_enable_domhtmlcss=1

" All of your Plugins must be added before the following line
call vundle#end()            " required

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
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

filetype plugin indent on    " required

colorscheme base16-atelierheath

" Airline Theme
let g:airline_theme = "powerlineish"

:hi Search ctermfg=020 ctermbg=026 guifg=#ff0000 guibg=bg
":hi StatusLine guibg=#292e37 guifg=#ffffff

" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
