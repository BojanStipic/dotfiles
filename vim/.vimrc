" vim: set foldmethod=marker foldlevel=0 :

" SETTINGS {{{1

" Tab width
set tabstop=4
" Indent with tabs
set noexpandtab
" Use the value of 'tabstop' to indent
set softtabstop=-1 shiftwidth=0
" English and Serbian language for spell check
" Toggle with `:set spell!`
set spelllang=en,sr@latin
" Copy indent from the current line when starting a new line
set autoindent
" When a file is changed outside of Vim, automatically read it again
set autoread
" Show line numbers
set number
" Display a vertical line at the 80th character
set colorcolumn=80
" Use true colors
if $COLORTERM == 'truecolor' && !$STY
	set termguicolors
endif
" Always show the status bar
set laststatus=2
" Hide default mode indicator, because vim-airline shows it
set noshowmode
" Minimal number of lines to keep above and below cursor
set scrolloff=15
" Search recursively with `:find`
set path+=**
" Ignore case in search patterns, when using lowercase pattern only
set ignorecase smartcase
" Highlight all search pattern matches
"set hlsearch
" Temporarily disable hlsearch
"nmap <silent> <Esc><Esc> :nohlsearch<CR>
" Don't wrap around the end of the file when searching
set nowrapscan
" Show invisible characters
set listchars=tab:\|\ ,trail:·
set list
" Allow backspacing over everything in insert mode
set backspace=indent,eol,start
" Display incomplete commands
set showcmd
" Display completion matches in a status line
set wildmenu
" No timeout for escape sequences, but timeout for mappings
set timeoutlen=2000 ttimeoutlen=0
" Show @@@ in the last line if it is truncated
set display=truncate
" Do incremental searching
set incsearch
" Do not recognize octal numbers for Ctrl-A and Ctrl-X
set nrformats-=octal
" Enable the mouse controls
set mouse=a
" No bell sound
set belloff=all
" Split to the right and below with `:vsplit` and `:split`
set splitright
set splitbelow
" Auto folds based on syntax
set foldmethod=syntax
set foldlevelstart=99
" Highlight the line with the cursor
"set cursorline
" Only insert the longest common text of the matches
set completeopt+=longest
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
"
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

let mapleader=' '
" Not vi compatible, but more logical. Works like C and D
map Y y$
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
" Auto close an XML tag
imap <lt>/ </<c-x><c-o><esc>==A
" Very magic search regex
map g/ /\v
map g? ?\v
" TextObject for the entire buffer
onoremap ie :<c-u>normal! meggVG<cr>`e
onoremap ae :<c-u>normal! meggVG<cr>`e
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
map <c-w>t :tab split<cr>
map <f3> :tab split<cr>
map <f4> <c-w>T
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
" Mappings for file browsing
let g:netrw_banner=0
nmap <cr> :edit %:p:h<cr>
nmap <leader>o :edit .<cr>
nmap <leader>O :edit %:p:h<cr>
nmap <leader>e :!xdg-open .<cr><cr>
nmap <leader>E :!xdg-open %:h<cr><cr>
" Sessions
nmap <leader>q :source Session.vim<cr>
nmap <leader>Q :Obsession<cr>
set sessionoptions-=curdir
set sessionoptions+=sesdir

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
Plug 'w0rp/ale'
Plug 'jiangmiao/auto-pairs'
Plug 'mattn/emmet-vim'
Plug 'SirVer/ultisnips'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'ap/vim-css-color'
call plug#end()

" PLUGIN CONFIGURATION {{{1

" VIM-AIRLINE {{{2
let g:airline_powerline_fonts=1
" Certain number of spaces are allowed after tabs, but not in between.
" This algorithm works well for /** */ style comments in a tab-indented file
let g:airline#extensions#whitespace#mixed_indent_algo=1
let g:airline#extensions#ale#show_line_numbers=0
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#tab_min_count = 2
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#tabline#tab_nr_type = 2
let g:airline#extensions#tabline#left_sep = '|'
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'unique_tail'
" ALE {{{2
let g:ale_linters_explicit=1
let g:ale_linters = {
\	'sh': ['shellcheck'],
\	'asm': ['gcc'],
\	'c': ['clangd'],
\	'cpp': ['clangd'],
\	'rust': ['rls'],
\	'java': ['javac'],
\	'javascript': ['eslint'],
\	'html': 'all',
\	'css': 'all',
\	'json': 'all',
\	'xml': 'all',
\}
let g:ale_fixers = {
\	'*': ['remove_trailing_lines', 'trim_whitespace'],
\	'markdown': ['remove_trailing_lines'],
\}
let g:ale_fix_on_save=1
let g:ale_sign_column_always=1
let g:ale_completion_enabled=1
let g:ale_set_balloons=1
nmap <leader>l :lopen<cr>
nmap <leader>L :lclose<cr>
map <silent> [e <plug>(ale_previous)
map <silent> ]e <plug>(ale_next)
nmap <silent> K <plug>(ale_hover)
nmap <silent> gd <plug>(ale_go_to_definition)
nmap <silent> gD <plug>(ale_go_to_type_definition)
nmap <silent> gr <plug>(ale_find_references)
" EMMET-VIM {{{2
let g:user_emmet_leader_key='<c-e>'
" ULTISNIPS {{{2
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetsDir="~/.vim/UltiSnips"
nmap <leader>s :UltiSnipsEdit<cr>
" VIM-GITGUTTER {{{2
set updatetime=1000
" FZF {{{2
nmap <silent> <c-p> :FZF<cr>
nmap <silent> <leader>p :FZF<cr>
nmap <silent> <leader>P :FZF %:h<cr>
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

let g:onedark_terminal_italics=1
let g:airline_theme='onedark'
colorscheme onedark
highlight Comment guifg=#8690A3
highlight Folded guifg=#8690A3
highlight SpecialKey guifg=#646D7A
"colorscheme morning
