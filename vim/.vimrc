set nocompatible              " be iMproved, required

" Font
set guifont=Source\ Code\ Pro\ 10

set autoindent "New lines inherit the indentation of previous lines
set autoread " Auto load files that have changed
set backspace=indent,eol,start "Make backspace work properly
set colorcolumn=120
set cursorline "Show horizontal cursor line
set expandtab "Turn tabs into spaces
set hid "Remember undo history
set hlsearch "Highlight Search
set incsearch "Search as characters are entered
set ignorecase "Case insensitive search
set noswapfile "Dont create swap files
set nu "Line Numbers
set ruler "Always show the cursor position
set shell=/bin/zsh "Set shell to execute commands
set showcmd "Show last command in bottom bar
set smartcase "Automatically switch to case-sensitive search if search contains uppercase letter
set syntax=enable
set t_Co=256 "Set max number of colors for host terminal
set ts=4 sw=4 sts=4 "Tab spacing
set title "Set window's title to file currently being edited
set viminfo^=% "Remember Buffers
set undolevels=1000 "Use many levels of undo
set wildmenu "Visual autocomplete for command menu
set wildignore+=.pyc,.swp "Ignore files matching these files when opening files based on a glob pattern

filetype plugin indent on    " required
syntax on

" Map leader to space
let mapleader="\<Space>"

" Vundle ======================================================
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" MiniBufExplorer
Plugin 'fholgado/minibufexpl.vim'

" Snippets
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "garbas/vim-snipmate"
Bundle "honza/vim-snippets"

"NERDTree
Bundle "scrooloose/nerdtree"

" Paredit
Bundle 'vim-scripts/paredit.vim'

" Ctrl P for fuzzy file search
Plugin 'ctrlp.vim'

" Base 16 theme
Plugin 'chriskempson/base16-vim'

" Vim Code Format
Plugin 'google/vim-maktaba'
Plugin 'google/vim-codefmt'
Plugin 'google/vim-glaive'

" Vim Bbye for sane buffer closing
Plugin 'moll/vim-bbye'

" C++ Enhanced Syntax
Plugin 'octol/vim-cpp-enhanced-highlight'

" Fugitive Git
Plugin 'tpope/vim-fugitive.git'

" Commentary for comments
Plugin 'tpope/vim-commentary'

"Git Gutter
Plugin 'airblade/vim-gitgutter'

" Airline
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" Ack
Plugin 'mileszs/ack.vim'

" Flake8
Plugin 'nvie/vim-flake8'

" Tmux Navigator
Plugin 'christoomey/vim-tmux-navigator'

" Vim Go
Plugin 'fatih/vim-go'

" Linting
Plugin 'w0rp/ale'

" Toggle between header and body files (C/C++)
nmap <F2> :if expand('%:e')=='hh'<CR>e %:r.cc<CR>else<CR>e %:r.hh<CR>endif<CR><CR>

" Map Ctrl-N to open nerd tree
map <C-n> :NERDTreeToggle<CR>

" Map Ctrl-M to open MiniBufExplorer
map <C-m> :MBEToggle<CR>

" Leader Mappings -----------------------------------
" Leader'vimrc' opens the vimrc file
map <leader>vimrc :e ~/.vimrc<CR> 

" Find the current buffer in NERDTree
map <leader>r :NERDTreeFind<cr>

" Last buffer
map <leader>l :b#<CR>

" Shut off search highlights
map <leader>s :nohlsearch<CR>

map <C-h> <C-W>h<CR>
map <C-j> <C-W>j<CR>
map <C-k> <C-W>k<CR>
map <C-l> <C-W>l<CR>

" All of your Plugins must be added before the following line
call vundle#end()            " required

call glaive#Install()

"Code Formatting
Glaive codefmt plugin[mappings]=',='
    \ clang_format_executable='/opt/clang+llvm-3.8.0/bin/clang-format'
    \ clang_format_style='file'

augroup autoformat
    autocmd!
    autocmd FileType cpp AutoFormatBuffer
augroup END

"Return to last edit position when opening files 
autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

" Variables -----------------------------------------

" NERDTree flags
let g:NERDTreeWinSize = 50 " Width of NERDTree
let g:NERDTreeShowHidden = 1 " Show hidden files
let g:NERDTreeIgnore = ['\.git$[[dir]]', '\.pyc$']

" Auto-open NERDTree when vim starts
" au VimEnter * NERDTree

" Ctrlp flags
set wildignore+=*/bin/*
set wildignore+=*/build/*
let g:ctrlp_map = '<Leader>t'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
let g:ctrlp_dotfiles = 0
let g:ctrlp_switch_buffer = 0
let g:ctrlp_max_files = 0
let g:ctrlp_max_depth = 40
let g:ctrlp_custom_ignore ='\v\~$|\.(o|swp|pyc|wav|mp3|ogg|blend|so|jar)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])|__init__\.py|CMakeFiles\CMakeCache\.txt$|cmake_install\.cmake$'

" Flake8 Flags
let g:flake8_show_in_gutter=1

" Ag Flags
let g:ackprg = 'ag --nogroup --nocolor --column'

" Go Flags
let g:go_fmt_fail_silently = 1
let g:go_fmt_command = "goimports"
let g:go_def_mode = 'godef'

" Ale (linting) flags
let g:ale_linters = {
            \ 'go': ['golint'],
            \ 'proto': ['prototool'],
            \ 'python': ['flake8'],
            \ }
let g:ale_lint_on_text_changed = 'never'

" Use a base16 theme on Mac or over ssh/tmux because it looks much better in iTerm2 than
" Monokai 
if has("mac") || $SSH_CONNECTION || exists('$TMUX')
    colorscheme base16-ocean
else
    colorscheme monokai
endif

" let base16colorspace=256

" Airline Theme
let g:airline_theme = 'powerlineish'

