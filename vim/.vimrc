" Options
set tabstop=4
set expandtab
set softtabstop=-1 shiftwidth=0

set spelllang=en,sr@latin
set scrolloff=15
set autoindent
set autoread
set backspace=indent,eol,start
set nrformats-=octal
set splitright
set splitbelow
set foldmethod=syntax
set foldlevelstart=99
set diffopt+=algorithm:patience
set diffopt+=indent-heuristic
set diffopt+=vertical
set incsearch
set ignorecase smartcase
set fileignorecase
set nowrapscan
set wildmenu
set wildmode=longest:full,full
set completeopt=menuone,longest,popup
set nomodeline
set noshowmode
set laststatus=2
set shortmess+=c
set showcmd
set number
set cursorline
set cursorlineopt=number
set signcolumn=yes
set colorcolumn=81
set list
set listchars=tab:\¦\ ,trail:·
set display=truncate
set timeoutlen=2000 ttimeoutlen=0
set updatetime=300
set mouse=a
set belloff=all
set sessionoptions-=curdir
set sessionoptions+=sesdir

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
let g:netrw_home = "~/.vim/cache/"
" Create directories if they don't already exist
silent! call mkdir(expand(&directory), 'p', 0700)
silent! call mkdir(expand(&undodir), 'p', 0700)
silent! call mkdir(expand(&backupdir), 'p', 0700)

" Keymaps
map <space> <nop>
map Y y$
nmap j gj
nmap k gk
nmap Q @q

nmap ZZ <nop>
imap <c-j> <nop>
imap <c-k> <nop>

map \ "+
map gp "0p
map gP "0P
nmap p ]p
nmap P ]P

nmap <silent> <space>z :set spell!<cr>
nmap <silent> <space>/ :set hlsearch! hlsearch?<cr>

inoremap (<cr> (<cr>)<esc>O
inoremap (;    (<cr>);<esc>O
inoremap (,    (<cr>),<esc>O
inoremap [<cr> [<cr>]<esc>O
inoremap [;    [<cr>];<esc>O
inoremap [,    [<cr>],<esc>O
inoremap {<cr> {<cr>}<esc>O
inoremap {;    {<cr>};<esc>O
inoremap {,    {<cr>},<esc>O

onoremap ie :<c-u>normal! meggVG<cr>`e
onoremap ae :<c-u>normal! meggVG<cr>`e

map H ^
map L $

map <c-h> <c-w>h
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
tmap <c-h> <c-w>h
tmap <c-j> <c-w>j
tmap <c-k> <c-w>k
tmap <c-l> <c-w>l

map <f1> gT
map <f2> gt
map <silent> <c-w>t :tab split<cr>
map <silent> <f3> :tab split<cr>
map <f4> <c-w>T
imap <f1> <nop>
imap <f2> <nop>
imap <f3> <nop>
imap <f4> <nop>

cmap %% <c-r>=fnameescape(expand("%:h")) . "/"<cr>
let g:netrw_banner = 0
nmap <silent> - :silent edit %:p:h<cr>
nmap <silent> <space>f :!xdg-open .<cr><cr>
nmap <silent> <space>F :!xdg-open %:p:h<cr><cr>

nmap <space>q :source Session.vim<cr>
nmap <space>Q :Obsession<cr>

" Auto commands
augroup vimrc
	autocmd!
	autocmd FileType gitcommit setlocal spell
augroup END

" Plugins
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
call plug#end()
packadd! matchit

" Plugin configuration

" vim-airline
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

" coc.nvim

let g:coc_data_home = "~/.vim/coc/"

" Diagnostics
nmap <silent> <space>l :lopen<cr>
nmap <silent> <space>L :lclose<cr>
map <silent> [e <plug>(coc-diagnostic-prev)
map <silent> ]e <plug>(coc-diagnostic-next)

" Symbol navigation
nmap <silent> <c-t> :CocList symbols<cr>
nmap <silent> <space>t :CocList symbols<cr>
nmap <silent> <space>o :CocList outline<cr>
command! -nargs=1 Rg :CocSearch -S <args>

" Symbol information
nmap <silent> K :call CocActionAsync('doHover')<cr>
nmap <silent> gd <plug>(coc-definition)
nmap <silent> gD :call CocActionAsync('jumpDefinition', 'vsplit')<cr>
nmap <silent> gy <plug>(coc-type-definition)
nmap <silent> gi <plug>(coc-implementation)
nmap <silent> gr <plug>(coc-references)
autocmd CursorHold * silent call CocActionAsync('highlight')
autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')

" Code actions
nmap <silent> <expr> <cr> &buftype ==# 'quickfix' ? "\<cr>" : "\<plug>(coc-codeaction-cursor)"
vmap <silent> <expr> <cr> &buftype ==# 'quickfix' ? "\<cr>" : "\<plug>(coc-codeaction-selected)"
nmap <silent> <space>r <plug>(coc-rename)
nmap <silent> <space>R <plug>(coc-refactor)
nmap <silent> <space>a <plug>(coc-fix-current)
" Organize imports
nmap <silent> <space>i :call CocActionAsync('runCommand', 'editor.action.organizeImport')<cr>
" Format the current buffer
command! -nargs=0 Format :call CocActionAsync('format')

" Expand snippet or emmet expression
imap <expr> <c-l> pumvisible() ? coc#_select_confirm() : ""
imap <expr> <cr> complete_info()["selected"] != "-1" ? "\<c-y>" : "\<cr>"
" Edit snippets file of current document filetype
nmap <space>s :vsplit<cr>:CocCommand snippets.editSnippets<cr>

" TextObjects
xmap if <plug>(coc-funcobj-i)
omap if <plug>(coc-funcobj-i)
xmap af <plug>(coc-funcobj-a)
omap af <plug>(coc-funcobj-a)
xmap ic <plug>(coc-classobj-i)
omap ic <plug>(coc-classobj-i)
xmap ac <plug>(coc-classobj-a)
omap ac <plug>(coc-classobj-a)

let g:coc_global_extensions = [
\	'coc-highlight',
\	'coc-snippets',
\	'coc-emmet',
\	'coc-rust-analyzer',
\	'coc-clangd',
\	'coc-java',
\	'coc-tsserver',
\	'coc-html',
\	'coc-css',
\	'coc-json',
\]

let g:coc_user_config = {
\	'coc.preferences.extensionUpdateCheck': 'never',
\	'languageserver': {
\		'bash': {
\			'command': 'bash-language-server',
\			'args': ['start'],
\			'filetypes': ['sh']
\		},
\	},
\	'list.insertMappings': {
\		'<c-t>': 'action:tabe',
\		'<c-s>': 'action:split',
\		'<c-v>': 'action:vsplit',
\	},
\	'suggest.removeDuplicateItems': v:true,
\	'snippets.convertToSnippetsAction': v:false,
\	'java.jdt.ls.vmargs': '-javaagent:/home/bojan/.lombok.jar',
\}

" vim-surround
nmap s ys
nmap S yS
xmap s S

" FZF
nmap <silent> <c-p> :FZF<cr>
nmap <silent> <space>p :FZF<cr>
nmap <silent> <space>P :FZF %:p:h<cr>
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

" Termdebug
packadd! termdebug
nmap <space>dd :Termdebug<space>
nmap <silent> <space>dD :call TermDebugSendCommand('quit')<cr>:Gdb<cr>y<cr>
nmap <space>dr :Run<cr>
nmap <space>dR :Stop<cr>
nmap <space>db :Break<cr>
nmap <space>dB :Clear<cr>
nmap <space>ds :Step<cr>
nmap <space>dn :Over<cr>
nmap <space>df :Finish<cr>
nmap <space>dc :Continue<cr>
nmap <space>dp :Evaluate<cr>
nmap <space>de :Evaluate<space>
nmap <space>dl :call TermDebugSendCommand('info locals')<cr>
nmap <space>da :call TermDebugSendCommand('info args')<cr>
let g:termdebug_wide = 1
let g:termdebugger = 'rust-gdb'

" Colorscheme
let g:onedark_terminal_italics = 1
let g:airline_theme = 'onedark'
colorscheme onedark
highlight Comment guifg=#8690A3
highlight Folded guifg=#8690A3
highlight SpecialKey guifg=#646D7A
highlight link CocErrorSign ErrorMsg
highlight link CocWarningSign WarningMsg
highlight link CocInfoSign Todo
highlight link CocHintSign Todo
highlight link CocHighlightText Visual
