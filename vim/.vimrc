set nocompatible              " be iMproved, required

" Font
set guifont=Source\ Code\ Pro\ 10

set autoindent "New lines inherit the indentation of previous lines
set autoread " Auto load files that have changed
set backspace=indent,eol,start "Make backspace work properly
set colorcolumn=80,120
set cursorline "Show horizontal cursor line
set expandtab "Turn tabs into spaces
set hid "Remember undo history
set hlsearch "Highlight Search
set incsearch "Search as characters are entered
set ignorecase "Case insensitive search
set linebreak "Only wrap lines at a character specified in the breakat option instead of in the middle of a word
set noswapfile "Dont create swap files
set nu "Line Numbers
set ruler "Always show the cursor position
set shell=/bin/zsh "Set shell to execute commands
set showbreak=>\ \ \
set showcmd "Show last command in bottom bar
set smartcase "Automatically switch to case-sensitive search if search contains uppercase letter
set syntax=enable
set t_Co=256 "Set max number of colors for host terminal
set title "Set window's title to file currently being edited
set ts=4 sw=4 sts=4 "Tab spacing
set viminfo^=% "Remember Buffers
set undolevels=1000 "Use many levels of undo
set wildmenu "Visual autocomplete for command menu
set wildignore+=.pyc,.swp "Ignore files matching these files when opening files based on a glob pattern
set wrap "Word wrap visually as opposed to changing the text in the buffer

filetype plugin indent on    " required
syntax on

" Map leader to space
let mapleader="\<Space>"

" Vundle ======================================================
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

let g:ale_disable_lsp = 1

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Snippets
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'honza/vim-snippets'

"NERDTree
Plugin 'scrooloose/nerdtree'

" Paredit
Plugin 'vim-scripts/paredit.vim'

" Color themes
Plugin 'chriskempson/base16-vim'
Plugin 'tomasiser/vim-code-dark'
Plugin 'dracula/vim'

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
Plugin 'dense-analysis/ale'

" Emmet
Plugin 'mattn/emmet-vim'

" JSX / Typescript / Svelte
Plugin 'leafgarland/typescript-vim'
Plugin 'peitalin/vim-jsx-typescript'
Plugin 'evanleck/vim-svelte'

" CoC
Plugin 'neoclide/coc.nvim'

" Buf
Plugin 'bufbuild/vim-buf'

" fzf for file searching
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'

" Use Ruff for Python linting/formatting
Plugin 'yaegassy/coc-ruff'


" set filetypes
autocmd BufNewFile,BufRead *.tsx,*.ts,*.jsx set filetype=typescriptreact
autocmd BufNewFile,BufRead *.vue set filetype=vue
autocmd BufNewFile,BufRead *.svelte set filetype=svelte

" Set Tab to be the Emmet expansion trigger while not causing it to happen
" when trying to actually indent
let g:user_emmet_install_global = 0
autocmd FileType html,css,javascript,typescriptreact  EmmetInstall
" autocmd FileType html,css,javascript,typescriptreact imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")

" Set tabs to 2 for Javascript files
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2

" Toggle between header and body files (C/C++)
" nmap <F2> :if expand('%:e')=='hh'<CR>e %:r.cc<CR>else<CR>e %:r.hh<CR>endif<CR><CR>
nmap <leader>c :if expand('%:e')=='hh'<CR>e %:r.cc<CR>else<CR>e %:r.hh<CR>endif<CR><CR>
" map <F2> :e %:p:s,.hh$,.X123X,:s,.cc$,.hh,:s,.X123X$,.cc,<CR>

" Map Ctrl-N to open nerd tree
map <C-n> :NERDTreeToggle<CR>

" Map Ctrl-M to open MiniBufExplorer
" map <C-m> :MBEToggle<CR>

" Leader Mappings -----------------------------------
" Leader'vimrc' opens the vimrc file
map <leader>vimrc :e ~/.vimrc<CR>

" Yank to system clipboard
map <leader>j "*y<CR>

" Find the current buffer in NERDTree
map <leader>r :NERDTreeFind<cr>

" Last buffer
map <leader>l :b#<CR>

" Shut off search highlights
map <leader>s :nohlsearch<CR>

" Go Mappings
map <leader>ga :GoAlternate<CR>

" ALENext / Previous
nmap <silent> <leader>an :ALENextWrap<cr>
nmap <silent> <leader>ap :ALEPreviousWrap<cr>

map <C-h> <C-W>h<CR>
map <C-j> <C-W>j<CR>
map <C-k> <C-W>k<CR>
map <C-l> <C-W>l<CR>

" All of your Plugins must be added before the following line
call vundle#end()            " required

call glaive#Install()

"Code Formatting
Glaive codefmt plugin[mappings]=',='
    \ clang_format_executable='clang-format'
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

" Coc Configuration -------------------------------
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    elseif (coc#rpc#ready())
        call CocActionAsync('doHover')
    else
        execute '!' . &keywordprg . " " . expand('<cword>')
    endif
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
    inoremap <silent><expr> <c-space> coc#refresh()
else
    inoremap <silent><expr> <Leader>j coc#refresh()
endif

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use tab for trigger completion with characters ahead and navigate.
" " NOTE: There's always complete item selected by default, you may want to
" enable
" " no select by `"suggest.noselect": true` in your configuration file.
" " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" " other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
    \ coc#pum#visible() ? coc#pum#next(1) :
    \ CheckBackspace() ? "\<Tab>" :
    \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" function! StripTrailingWhitespaces()
"     let save_cursor = getpos(".")
"     %s/\s\+$//e
"     call setpos('.', save_cursor)
" endfunction
" command! -range=% StripTrailingWhitespaces call StripTrailingWhitespaces()
" autocmd BufWritePre * :call StripTrailingWhitespaces()

" Variables -----------------------------------------
" CoC
let g:coc_disable_startup_warning = 1

" NERDTree flags
let g:NERDTreeWinSize = 50 " Width of NERDTree
let g:NERDTreeShowHidden = 1 " Show hidden files
let g:NERDTreeIgnore = ['\.git$[[dir]]', '\.pyc$', '\.DS_Store']
let g:NERDTreeMinimalMenu=1

" Auto-open NERDTree when vim starts
" au VimEnter * NERDTree

" Flake8 Flags
let g:flake8_show_in_gutter=1

" Ag Flags
let g:ackprg = 'ag --nogroup --nocolor --column'

" Go Flags
let g:go_fmt_fail_silently = 1
let g:go_fmt_command = "goimports"
let g:go_def_mode = 'godef'

" Ale (linting) flags
let g:ale_sign_column_always = get(g:, 'ale_sign_column_always', 0)
let g:ale_javascript_eslint_use_global = 1
let g:ale_linters = {
            \ 'go': ['golint'],
            \ 'proto': ['buf-lint'],
            \ 'python': ['flake8'],
            \ 'javascript': ['eslint'],
            \ 'typescriptreact': ['eslint'],
            \ 'vue': ['eslint'],
            \ 'svelte': ['eslint'],
            \ }
let g:ale_lint_on_text_changed = 'never'
let g:ale_fix_on_save = 1
let g:ale_fixers = {
            \   'javascript': ['prettier'],
            \   'typescriptreact': ['prettier'],
            \   'vue': ['prettier'],
            \   'svelte': ['prettier'],
            \   'css': ['prettier'],
            \}

" Only run linters named in ale_linters settings.
let g:ale_linters_explicit = 1
let g:ale_set_highlights = 0

let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
highlight ALEErrorSign ctermbg=NONE ctermfg=red
highlight ALEWarningSign ctermbg=NONE ctermfg=yellow

" Color schemes
" colorscheme codedark
" colorscheme monokai
colorscheme base16-ocean
let base16colorspace=256
set background=dark

" Airline Theme
let g:airline_theme = 'powerlineish'

