set nocompatible              " be iMproved, required

" Font
set guifont=Source\ Code\ Pro\ 10

set autoindent "New lines inherit the indentation of previous lines
set autoread " Auto load files that have changed
set backspace=indent,eol,start "Make backspace work properly
set colorcolumn=80,120
set cursorline "Show horizontal cursor line
set expandtab "Turn tabs into spaces
set hidden "Remember undo history
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
set t_Co=256 "Set max number of colors for host terminal
set title "Set window's title to file currently being edited
set ts=4 sw=4 sts=4 "Tab spacing
set viminfo^=% "Remember Buffers
set undolevels=1000 "Use many levels of undo
set wildmenu "Visual autocomplete for command menu
set wildignore+=.pyc,.swp "Ignore files matching these files when opening files based on a glob pattern
set wildignorecase "Case insensitive for visual autocomplete
set wrap "Word wrap visually as opposed to changing the text in the buffer

" set signcolumn=yes          " Always show sign column, prevents layout shift
set scrolloff=4             " Keep 8 lines visible above/below cursor (i use 4)
set splitright              " New vertical splits go right
set splitbelow              " New horizontal splits go below

filetype plugin indent on    " required
syntax on

" Map leader to space
let mapleader="\<Space>"

" vim-Plug ======================================================
call plug#begin('~/.vim/plugged')

" Startup screen
Plug 'mhinz/vim-startify'

" Snippets
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'honza/vim-snippets'

"NERDTree
Plug 'scrooloose/nerdtree'

" Color themes
Plug 'chriskempson/base16-vim'
Plug 'tomasiser/vim-code-dark'
Plug 'dracula/vim'

" Vim Code Format
Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'
Plug 'google/vim-glaive'

" Vim Bbye for sane buffer closing
Plug 'moll/vim-bbye'

" C++ Enhanced Syntax
Plug 'octol/vim-cpp-enhanced-highlight'

" Fugitive Git
Plug 'tpope/vim-fugitive'

" Commentary for comments
Plug 'tpope/vim-commentary'

" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Flake8
Plug 'nvie/vim-flake8'

" Tmux Navigator
Plug 'christoomey/vim-tmux-navigator'

" Vim Go
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" Linting
Plug 'dense-analysis/ale'

" Emmet
Plug 'mattn/emmet-vim'

" JSX / Typescript / Svelte
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'evanleck/vim-svelte'

" CoC
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Buf
Plug 'bufbuild/vim-buf'

" fzf for file searching
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

" Use Ruff for Python linting/formatting
Plug 'yaegassy/coc-ruff'


" set filetypes
autocmd BufNewFile,BufRead *.vue set filetype=vue
autocmd BufNewFile,BufRead *.svelte set filetype=svelte

" For Vue files, use // comments
autocmd FileType vue setlocal commentstring=//\ %s

" Set Tab to be the Emmet expansion trigger while not causing it to happen
" when trying to actually indent
let g:user_emmet_install_global = 0
autocmd FileType html,css,javascript,typescriptreact  EmmetInstall
" Comment this line to shut off emmet
autocmd FileType html,css,javascript,typescriptreact imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")

" Set tabs to 2 for Javascript files
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2

" This opens the last open file by default if Vim is opened with no args
" autocmd VimEnter * nested if argc() == 0 && !exists("s:std_in") | execute 'e ' . v:oldfiles[0] | endif

" Open NERDTree by default set focus to the startify pane
autocmd VimEnter * NERDTree | wincmd p

" Toggle between header and body files (C/C++)
" nmap <F2> :if expand('%:e')=='hh'<CR>e %:r.cc<CR>else<CR>e %:r.hh<CR>endif<CR><CR>
nmap <leader>c :if expand('%:e')=='hh'<CR>e %:r.cc<CR>else<CR>e %:r.hh<CR>endif<CR><CR>
" map <F2> :e %:p:s,.hh$,.X123X,:s,.cc$,.hh,:s,.X123X$,.cc,<CR>

" Map Ctrl-N to open nerd tree
map <C-n> :NERDTreeToggle<CR>

" Leader Mappings -----------------------------------
" Leader'vimrc' opens the vimrc file
nnoremap <leader>vimrc :e ~/.vimrc<CR>

" Yank to system clipboard
nnoremap <leader>j "+y
xnoremap <leader>j "+y

" Find the current buffer in NERDTree
nnoremap <leader>r :NERDTreeFind<cr>

" Last buffer
nnoremap <leader>l :b#<CR>

" Shut off search highlights
nnoremap <leader>s :nohlsearch<CR>

" Go Mappings
nnoremap <leader>ga :GoAlternate<CR>

"  Open fzf to search for files
nnoremap <leader>f :Files<CR>

" ALENext / Previous
nmap <silent> <leader>an :ALENextWrap<cr>
nmap <silent> <leader>ap :ALEPreviousWrap<cr>

" Use fd for fzf file listing — respects .gitignore, excludes common junk
let $FZF_DEFAULT_COMMAND = 'fdfind --type f --hidden --follow ' .
    \ '--exclude .git ' .
    \ '--exclude node_modules ' .
    \ '--exclude .toolchain ' .
    \ '--exclude build ' .
    \ '--exclude dist ' .
    \ '--exclude gen'

let $FZF_DEFAULT_OPTS = '--height 40% --border'

" All of your Plugs must be added before the following line
call plug#end()            " required

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

" Strip trailing whitespace on save
function! StripTrailingWhitespaces()
    let save_cursor = getpos(".")
    %s/\s\+$//e
    call setpos('.', save_cursor)
endfunction
command! -range=% StripTrailingWhitespaces call StripTrailingWhitespaces()
autocmd BufWritePre * :call StripTrailingWhitespaces()

" Variables -----------------------------------------

" Save the working directory at startup and always open the fzf file search
" from that dir
let g:start_dir = getcwd()
nnoremap <leader>f :execute 'Files ' . g:start_dir<CR>

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

" Go Flags
let g:go_fmt_fail_silently = 1
let g:go_fmt_command = "goimports"
let g:go_def_mode = 'gopls'
let g:go_info_mode = 'gopls'

" Ale (linting) flags
let g:ale_disable_lsp = 1

let g:ale_linters = {
            \ 'go': ['golangci-lint'],
            \ 'proto': ['buf-lint'],
            \ 'python': ['ruff'],
            \ 'javascript': ['eslint'],
            \ 'typescript': ['eslint'],
            \ 'vue': ['eslint'],
            \ }

let g:ale_fixers = {
            \   'javascript': ['prettier'],
            \   'json': ['prettier'],
            \   'typescript': ['prettier'],
            \   'vue': ['prettier'],
            \   'svelte': ['prettier'],
            \   'css': ['prettier'],
            \ }

" Ale (linting) flags
let g:ale_sign_column_always = get(g:, 'ale_sign_column_always', 0)
let g:ale_javascript_eslint_use_global = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_fix_on_save = 1

" Only run linters named in ale_linters settings.
let g:ale_linters_explicit = 1
let g:ale_set_highlights = 0

let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
highlight ALEErrorSign ctermbg=NONE ctermfg=red
highlight ALEWarningSign ctermbg=NONE ctermfg=yellow



" Color schemes
" colorscheme monokai
colorscheme base16-ocean
let base16colorspace=256
set background=dark
" This fixes the green line issue with base16
set termguicolors

" Airline Theme
let g:airline_theme = 'powerlineish'

