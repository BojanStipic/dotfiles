" Vim 8 defaults
source $VIMRUNTIME/defaults.vim

" SETTINGS {{{1

" Tab width
set tabstop=4
" Indent with tabs
set noexpandtab
" Don't change unless insane
set softtabstop=-1 shiftwidth=0
" English and Serbian language for spell check
" Toggle with `set spell!`
set spelllang=en,sr@latin
" Copy indent from the current line when starting a new line
set autoindent
" When a file is changed outside of Vim, automatically read it again
set autoread
" Always show the line numbers
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
" Search recursively with :find
set path=.,,**
" Ignore case in search patterns, when using lowercase pattern only.
set ignorecase smartcase
" Highlight all search pattern matches
"set hlsearch
" Disable hlsearch
"nmap <silent> <Esc><Esc> :nohlsearch<CR>
" Show invisible characters
set listchars=tab:\|\ ,trail:·
set list
" No bell sound
set belloff=all
" Split to the right and below with :vsplit and :split
set splitright
set splitbelow
" Auto folds based on syntax
set foldmethod=syntax
set foldlevelstart=99
" Highlight the line with the cursor
set cursorline
" Different cursor for different modes
if &term =~ "xterm"
	" Insert mode - line
	let &t_SI = "\<Esc>[5 q"
	" Replace mode - underline
	let &t_SR = "\<Esc>[3 q"
	" Common - block
	let &t_EI = "\<Esc>[2 q"
	" Reset on exit
	autocmd VimLeave * silent! !echo -ne "\e[ q"
endif

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
" Auto close an XML tag
imap <lt>/ </<c-x><c-o><esc>==A
" Very magic search regex
map g/ /\v
map g? ?\v
" TextObject for entire buffer
onoremap ie :<c-u>normal! meggVG<cr>`e
onoremap ae :<c-u>normal! meggVG<cr>`e
" Change the focus between windows
map <c-h> <c-w>h
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l

" PLUGINS {{{1

" Automatically install vim-plug if not installed
if empty(glob('~/.vim/autoload/plug.vim'))
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
	\	https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/bundle')
Plug 'w0rp/ale'
Plug 'jiangmiao/auto-pairs'
Plug 'mattn/emmet-vim'
Plug 'joshdick/onedark.vim'
Plug 'tpope/vim-abolish'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-commentary'
Plug 'ap/vim-css-color'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-surround'
call plug#end()

" PLUGIN CONFIGURATION {{{1

" emmet-vim
let g:user_emmet_leader_key='<c-e>'
" vim-airline
let g:airline_powerline_fonts=1
" Certain number of spaces are allowed after tabs, but not in between.
" This algorithm works well for /** */ style comments in a tab-indented file
let g:airline#extensions#whitespace#mixed_indent_algo=1
let g:airline#extensions#ale#show_line_numbers=0
" ale
let g:ale_linters_explicit=1
let g:ale_linters = {
\	'sh': ['shellcheck'],
\	'asm': ['gcc'],
\	'c': ['clangd'],
\	'cpp': ['clangd'],
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
map <leader>lo :lopen<cr>
map <leader>lc :lclose<cr>
nmap <silent> [e <plug>(ale_previous_wrap)
nmap <silent> ]e <plug>(ale_next_wrap)
" vim-gitgutter
set updatetime=1000
" fzf
map <silent> <c-p> :FZF<cr>
map <silent> <leader>p :FZF<cr>
map <silent> <leader>c :cd %:h<cr>
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

" COLORSCHEME {{{1

let g:onedark_terminal_italics=1
let g:airline_theme='onedark'
colorscheme onedark
highlight Comment guifg=#8690A3
highlight Folded guifg=#8690A3
highlight SpecialKey guifg=#646D7A
"colorscheme morning

" vim: set foldmethod=marker foldlevel=0 nomodeline:
