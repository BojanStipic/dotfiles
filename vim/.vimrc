"
" ~/.vimrc
"

" SETTINGS {{{1

" Tab width
set tabstop=4
" Indent with spaces
set expandtab
" Use the value of 'tabstop' to indent
set softtabstop=-1 shiftwidth=0

" English and Serbian language for spell check
set spelllang=en,sr@latin
" Minimal number of lines to keep above and below cursor
set scrolloff=15
" Minimal automatic indenting for any filetype
set autoindent
" When a file is changed outside of Vim, automatically read it again
set autoread
" Allow backspacing over everything in insert mode
set backspace=indent,eol,start
" Search recursively with `:find`
set path+=**
" Do not recognize octal numbers for Ctrl-A and Ctrl-X
set nrformats-=octal
" Split to the right and below with `:vsplit` and `:split`
set splitright
set splitbelow
" Auto folds based on syntax
set foldmethod=syntax
set foldlevelstart=99
" Make vimdiff better: https://vimways.org/2018/the-power-of-diff/
set diffopt+=algorithm:patience
set diffopt+=indent-heuristic

" Do incremental searching
set incsearch
" Ignore case when searching for lowercase patterns
set ignorecase smartcase
" Ignore case when using file names and directories
set fileignorecase
" Don't wrap around the end of the file when searching
set nowrapscan

" Display completion matches in a status line
set wildmenu
set wildmode=longest:full,full
" Completion menu
set completeopt=menuone,longest,popup

" Modelines have historically been a source of security/resource vulnerabilities
set nomodeline
" Always show the status bar
set laststatus=2
" Hide default mode indicator, because vim-airline shows it
set noshowmode
" Hide ins-completion-menu messages
set shortmess+=c
" Display incomplete commands
set showcmd
" Show line numbers
set number
" Highlight the text line of the cursor
set cursorline
set cursorlineopt=number
" Always show signcolumn
set signcolumn=yes
" Display a vertical ruler
set colorcolumn=81
" Show invisible characters
set listchars=tab:\¦\ ,trail:·
set list
" Show @@@ in the last line if it is truncated
set display=truncate

" No timeout for escape sequences, but timeout for mappings
set timeoutlen=2000 ttimeoutlen=0
" Timeout for CursorHold autocommand
set updatetime=300
" Enable the mouse controls
set mouse=a
" No bell sound
set belloff=all
" Use true colors on supported terminals
if $COLORTERM == 'truecolor' && !$STY
	set termguicolors
endif
" Different cursor shapes for different modes
if &term =~ "xterm"
	" Insert mode - line
	let &t_SI = "\<Esc>[5 q"
	" Replace mode - underline
	let &t_SR = "\<Esc>[3 q"
	" Common - block
	let &t_EI = "\<Esc>[2 q"
	" t_ti (put in termcap mode) - first sequence sent to the terminal when entering Vim.
	" Prepend to this sequence to change the cursor shape on startup.
	let &t_ti = &t_EI . &t_ti
	" t_te (out of termcap) - last sequence emitted to the terminal before exiting Vim.
	" Prepend to this sequence to change the cursor shape on exit.
	let &t_te = "\<Esc>[ q" . &t_te
endif

" Put temporary files in ~/.vim/cache directory
set swapfile undofile nobackup
set directory=~/.vim/cache/swap//
set undodir=~/.vim/cache/undo//
set backupdir=~/.vim/cache/backup//
set viminfo+=n~/.vim/cache/viminfo
let g:netrw_home="~/.vim/cache/"
" Create directories if they don't already exist
silent! call mkdir(expand(&directory), 'p', 0700)
silent! call mkdir(expand(&undodir), 'p', 0700)
silent! call mkdir(expand(&backupdir), 'p', 0700)

" MAPPINGS {{{1

map <space> <nop>
let mapleader=' '
" Not vi compatible, but more logical. Works like C and D
map Y y$
" Move by display lines
nmap j gj
nmap k gk
" Quickly execute the temporary macro
nmap Q @q
" Prevent the accidental ZZ command
nmap ZZ <nop>
" Clipboard register
map \ "+
" Paste from the most recent yank register
map gp "0p
map gP "0P
" Adjust indent to current line on paste
nmap p ]p
nmap P ]P
" Toggle spell checking
nmap <silent> <leader>z :set spell!<cr>
" Highlight all search pattern matches
nmap <silent> <leader>/ :set hlsearch! hlsearch?<cr>
" Expand multiline pairs
inoremap (<cr> (<cr>)<esc>O
inoremap (;    (<cr>);<esc>O
inoremap (,    (<cr>),<esc>O
inoremap [<cr> [<cr>]<esc>O
inoremap [;    [<cr>];<esc>O
inoremap [,    [<cr>],<esc>O
inoremap {<cr> {<cr>}<esc>O
inoremap {;    {<cr>};<esc>O
inoremap {,    {<cr>},<esc>O
" Very magic search regex
map g/ /\v
map g? ?\v
" TextObject for the entire buffer
onoremap ie :<c-u>normal! meggVG<cr>`e
onoremap ae :<c-u>normal! meggVG<cr>`e
" Jump to the beginning/end of line
map H ^
map L $
" Mappings for windows
map <c-h> <c-w>h
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
tmap <c-h> <c-w>h
tmap <c-j> <c-w>j
tmap <c-k> <c-w>k
tmap <c-l> <c-w>l
" Mappings for tabs
map <f1> gT
map <f2> gt
map <silent> <c-w>t :tab split<cr>
map <silent> <f3> :tab split<cr>
map <f4> <c-w>T
imap <f1> <nop>
imap <f2> <nop>
imap <f3> <nop>
imap <f4> <nop>
map <leader>1 1gt
map <leader>2 2gt
map <leader>3 3gt
map <leader>4 4gt
map <leader>5 5gt
map <leader>6 6gt
map <leader>7 7gt
map <leader>8 8gt
map <leader>9 9gt
map <leader>0 1gT
map <leader>- gT
map <leader>= gt
" Expand %% to the current file's directory
cmap %% <c-r>=fnameescape(expand("%:h")) . "/"<cr>
" File browsing
let g:netrw_banner=0
nmap <silent> - :silent edit %:p:h<cr>
nmap <silent> <leader>f :!xdg-open .<cr><cr>
nmap <silent> <leader>F :!xdg-open %:p:h<cr><cr>
" Sessions
nmap <leader>q :source Session.vim<cr>
nmap <leader>Q :Obsession<cr>
" Don't save CWD to make session files portable
set sessionoptions-=curdir
set sessionoptions+=sesdir

" AUTOCOMMANDS {{{1

augroup vimrc
	autocmd!
	autocmd BufRead ~/.vimrc setlocal foldmethod=marker foldlevel=0
	autocmd FileType gitcommit setlocal spell
augroup END

" PLUGINS {{{1

" Automatically install vim-plug if not installed
if empty(glob('~/.vim/autoload/plug.vim'))
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
	\	https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/bundle')
Plug 'vim-airline/vim-airline'
Plug 'joshdick/onedark.vim'
Plug 'sheerun/vim-polyglot'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'wellle/targets.vim'
call plug#end()
packadd! matchit

" PLUGIN CONFIGURATION {{{1

" VIM-AIRLINE {{{2
" Certain number of spaces are allowed after tabs, but not in between.
" This algorithm works well for /** */ style comments in a tab-indented file
let g:airline#extensions#whitespace#mixed_indent_algo = 1
let g:airline#extensions#ale#show_line_numbers = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#tab_min_count = 2
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#tabline#tab_nr_type = 2
let g:airline#extensions#tabline#formatter = 'unique_tail'

" COC {{{2

let g:coc_data_home="~/.vim/coc/"

" Diagnostics
nmap <silent> <leader>l :lopen<cr>
nmap <silent> <leader>L :lclose<cr>
map <silent> [e <plug>(coc-diagnostic-prev)
map <silent> ]e <plug>(coc-diagnostic-next)

" Symbol navigation
nmap <silent> <c-t> :CocList symbols<cr>
nmap <silent> <leader>t :CocList symbols<cr>
nmap <silent> <leader>o :CocList outline<cr>

" Symbol information
nmap <silent> K :call CocAction('doHover')<cr>
nmap <silent> gd <plug>(coc-definition)
nmap <silent> gD :call CocAction('jumpDefinition', 'vsplit')<cr>
nmap <silent> gr <plug>(coc-references)
autocmd CursorHold * silent call CocActionAsync('highlight')
autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')

" Code actions
nmap <silent> <cr> <plug>(coc-codeaction)
nmap <silent> <leader>r <plug>(coc-rename)
nmap <silent> <leader>R <plug>(coc-refactor)
nmap <silent> <leader>a <plug>(coc-fix-current)
" Organize imports
nmap <silent> <leader>i :call CocAction('runCommand', 'editor.action.organizeImport')<cr>
" Format the current buffer
command! -nargs=0 Format :call CocAction('format')

" Expand snippet or emmet expression
"imap <expr> <c-l> pumvisible() ? coc#_select_confirm() : ""
imap <expr> <cr> complete_info()["selected"] != "-1" ? "\<c-y>" : "\<cr>"
" Edit snippets file of current document filetype
nmap <leader>s :vsplit<cr>:CocCommand snippets.editSnippets<cr>

" TextObject for a function
xmap if <plug>(coc-funcobj-i)
xmap af <plug>(coc-funcobj-a)
omap if <plug>(coc-funcobj-i)
omap af <plug>(coc-funcobj-a)

let g:coc_global_extensions = [
\	'coc-highlight',
\	'coc-snippets',
\	'coc-emmet',
\	'coc-rust-analyzer',
\	'coc-java',
\	'coc-tsserver',
\	'coc-html',
\	'coc-css',
\	'coc-json',
\]

let g:coc_user_config = {
\	'languageserver': {
\		'bash': {
\			'command': 'bash-language-server',
\			'args': ['start'],
\			'filetypes': ['sh']
\		},
\		'clangd': {
\			'command': 'clangd',
\			'filetypes': ['c', 'cpp']
\		},
\	},
\	'list.insertMappings': {
\		'<c-t>': 'action:tabe',
\		'<c-s>': 'action:split',
\		'<c-v>': 'action:vsplit',
\	},
\	'snippets.convertToSnippetsAction': v:false,
\}

highlight link CocErrorSign ErrorMsg
highlight link CocWarningSign WarningMsg
highlight link CocInfoSign Todo
highlight link CocHintSign Todo
highlight link CocHighlightText Visual

" VIM-SURROUND {{{2
nmap s ys
nmap S yS
xmap s S

" FZF {{{2
nmap <silent> <c-p> :FZF<cr>
nmap <silent> <leader>p :FZF<cr>
nmap <silent> <leader>P :FZF %:p:h<cr>
let g:fzf_action = {
\	'ctrl-t': 'tab split',
\	'ctrl-s': 'split',
\	'ctrl-v': 'vsplit'
\}

" Customize fzf colors to match the color scheme
let g:fzf_colors = {
\	'fg':      ['fg', 'Normal'],
\	'bg':      ['bg', 'Normal'],
\	'hl':      ['fg', 'Comment'],
\	'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
\	'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
\	'hl+':     ['fg', 'Statement'],
\	'info':    ['fg', 'PreProc'],
\	'border':  ['fg', 'Ignore'],
\	'prompt':  ['fg', 'Conditional'],
\	'pointer': ['fg', 'Exception'],
\	'marker':  ['fg', 'Keyword'],
\	'spinner': ['fg', 'Label'],
\	'header':  ['fg', 'Comment']
\}

" TERMDEBUG {{{2
packadd! termdebug
nmap <leader>dd :Termdebug<space>
nmap <silent> <leader>dD :call TermDebugSendCommand('quit')<cr>:Gdb<cr>y<cr>
nmap <leader>dr :Run<cr>
nmap <leader>dR :Stop<cr>
nmap <leader>db :Break<cr>
nmap <leader>dB :Clear<cr>
nmap <leader>ds :Step<cr>
nmap <leader>dn :Over<cr>
nmap <leader>df :Finish<cr>
nmap <leader>dc :Continue<cr>
nmap <leader>dp :Evaluate<cr>
nmap <leader>de :Evaluate<space>
nmap <leader>dl :call TermDebugSendCommand('info locals')<cr>
nmap <leader>da :call TermDebugSendCommand('info args')<cr>
let g:termdebug_wide = 1

" COLORSCHEME {{{1

let g:onedark_terminal_italics = 1
let g:airline_theme = 'onedark'
colorscheme onedark
highlight Comment guifg=#8690A3
highlight Folded guifg=#8690A3
highlight SpecialKey guifg=#646D7A

set guifont=Hack\ 14
" Get rid of unnecessary GUI elements in gvim
set guioptions=
