set nocompatible              " be iMproved, required
filetype off                  " required

" Enable syntax highlighting
syntax on

" Load color scheme
if has("gui_running")
	"set background=dark
	colorscheme base16-atelierheath
else
	colorscheme stonewashed-256
endif

set lines=999 columns=9999

set guifont=Droid\ Sans\ Mono\ 10

" Line Numbers
set nu

" Color the non-text lines the same as the background
:hi NonText guifg=fg guibg=bg

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

" HIDL Syntax
Plugin 'ssh://code@code.int.uberatc.com/diffusion/VIMHIDL/vim-hidl-ftplugin.git'

" Ctrl P for fuzzy file search
Plugin 'ctrlp.vim'

" Base 16 theme
Plugin 'chriskempson/base16-vim'

" Change trigger for Emmet to tab
imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")

" Map Shift-Enter to Escape
:inoremap <S-CR> <Esc>

" Map Ctrl-N to open nerd tree
map <C-n> :NERDTreeToggle<CR>

" Map Ctrl-c to copy a line in visual mode (vnoremap)
vnoremap <C-c> "+yy

" Map ; to open Ctrl P buffer
"nmap ; :CtrlPBuffer<CR>

" Javascript Syntax
Bundle "pangloss/vim-javascript"
let javascript_enable_domhtmlcss=1

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
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
