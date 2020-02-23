call plug#begin('~/.vim/plugged')
  Plug 'dracula/vim', {'as':'dracula'}
  Plug 'msanders/snipmate.vim'
	Plug 'junegunn/fzf.vim'
call plug#end()

syntax on
filetype plugin indent on

" Display
set background=dark
set nu
set ruler
set wildmenu
set nofoldenable

" Finder
set path+=**
set wildignore+=**/.git/**
set wildignore+=**/node_modules/**

" Indent
set tabstop=2
set shiftwidth=2
set softtabstop=2 
set noexpandtab
set smartindent
set smarttab
set breakindent

" Editing
set undolevels=100
set backspace=indent,eol,start
set nobackup
set nowritebackup
set noswapfile
set ttimeoutlen=0
set textwidth=0
"set cursorline
set incsearch
set ignorecase
set smartcase
set omnifunc=syntaxcomplete#Complete

" Buffer
set hidden

" Remap
let mapleader=" "

nnoremap j gj
nnoremap k gk

" Toggle netrw
nnoremap <silent> <Leader>t :Lexplore<CR>

" Xsel map
vnoremap <silent> <Leader>y "+y<CR>
nnoremap <silent> <Leader>p "+p<CR>

" AutoCommand
augroup filetype_handler
  au BufRead Makefile setl noexpandtab
  au FileType snippets setl noexpandtab
augroup END

" Netrw
let g:netrw_banner=0
let g:netrw_liststyle=3
let g:netrw_sort_options='i'
let g:netrw_winsize=30
let g:netrw_sort_sequence='[\/]$,*'
let g:netrw_browse_split=4
let g:netrw_list_hide='\(^\|\s\s\)\zs\.\S\+'

" Colorscheme
colo dracula
hi Normal guibg=NONE ctermbg=NONE
