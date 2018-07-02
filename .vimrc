call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
Plug 'tpope/vim-sensible'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

nnoremap <C-p> :FZF<Enter> 
inoremap <C-p> :FZF<Enter> 

nnoremap F :NERDTree<Enter>



