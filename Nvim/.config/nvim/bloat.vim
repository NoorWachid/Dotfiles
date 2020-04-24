call plug#begin('~/.local/share/nvim/plugged')
Plug 'preservim/nerdtree'
Plug 'junegunn/fzf.vim'
Plug 'ericcurtin/CurtineIncSw.vim'
Plug 'bfrg/vim-cpp-modern'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'morhetz/gruvbox'
call plug#end()

so ~/.config/nvim/coc.vim

" IncSwitch
nnoremap <silent> <Leader>s :call CurtineIncSw()<CR>

" NerdTree
nnoremap <silent> <Leader>n :NERDTreeToggle<CR>
nnoremap <silent> <Leader>N :NERDTreeFind<CR>

" Fzf
nnoremap <silent> <Leader>t :FZF<CR>
nnoremap <silent> <Leader>/ :Rg<CR>
nnoremap <silent> <Leader>. :Buffers<CR>

au BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
