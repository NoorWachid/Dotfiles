" Colorscheme
set runtimepath+=~/Projects/VimPink
colo pink

" Display
set nu
set ruler
set wildmenu

" Finder
set path+=**
set wildignore+=**/.git/**
set wildignore+=**/node_modules/**

" Indent
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
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
set cursorline
set incsearch

" Buffer
set hidden

" Remap
let mapleader=" "

" Custom
nnoremap Y y$
nnoremap j gj
nnoremap k gk
tnoremap <Esc> <C-\><C-n>
nnoremap <silent> <Leader>o :noh<CR>
nnoremap <Leader>a :wa<CR>
nnoremap <Leader>r :! 
nnoremap <Leader>c :!cr 
nnoremap <silent> <F4> :e ~/.config/nvim/init.vim<CR>
nnoremap <silent> <F5> :so ~/.config/nvim/init.vim<CR>

nnoremap <silent> <Leader>z zfi{

" Xsel
vnoremap <silent> <Leader>y "+y<CR>
nnoremap <silent> <Leader>p "+p<CR>

map <silent> <F6>  :w  \| :make %<.o<CR>
map <silent> <F7>  :w  \| :make link<CR>
map <silent> <F8>         :make run<CR>
map <silent> <F9>  :w  \| :make %<.o link run<CR>
map <silent> <F10> :wa \| :make<CR>

" AutoCommand
augroup FiletypeHandler
  au BufRead Makefile setl noexpandtab
augroup END

