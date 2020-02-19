call plug#begin('~/.vim/plugged')
  Plug 'dracula/vim', {'as':'dracula'}
  Plug 'msanders/snipmate.vim'
	Plug 'chrisbra/Colorizer'
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

" Xclip map
vnoremap <silent> <Leader>y  :!xclip -f -sel clip<CR>
nnoremap <silent> <Leader>p  :r !xclip -o -sel clip<CR>

" AutoCommand
augroup filetype_handler
  au BufRead Makefile setl noexpandtab
  au FileType snippets setl noexpandtab
  au FileType c
    \ map <F9> :!clear; ./bin/%< <CR> | 
    \ map <F10> :!clear; clang % -o bin/%< && ./bin/%< <CR> |
    \ nnoremap <silent> <Leader>s :e %:p:s,.h$,.X123X,:s,.c$,.h,:s,.X123X$,.c,<CR>
  au FileType cpp 
    \ map <F9> :!clear; ./bin/%< <CR> | 
    \ map <F10> :!clear; clang++ % -o bin/%< && ./bin/%< <CR> |
    \ nnoremap <silent> <Leader>s :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>
  au FileType sh map <F9> ::!clear; ./% <CR>
augroup END

augroup change_path_relative_to_current_buffer
  au InsertEnter * let s:saved_cwd = getcwd() | set autochdir
  au InsertLeave * set noautochdir | exec 'cd' fnameescape(s:saved_cwd)
augroup END

" Netrw
let g:netrw_banner=0
"let g:netrw_liststyle=3
let g:netrw_sort_options='i'
let g:netrw_winsize=30
let g:netrw_sort_sequence='[\/]$,*'
let g:netrw_browse_split=4
let g:netrw_list_hide='\(^\|\s\s\)\zs\.\S\+'

" Always put colorscheme  in the end
" for better load time.
colo dracula
hi Normal guibg=NONE ctermbg=NONE
