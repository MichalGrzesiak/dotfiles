if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" Declare the list of plugins.

Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

nnoremap <C-p> :FZF<Enter> 
inoremap <C-p> :FZF<Enter> 

nnoremap F :NERDTree<Enter>

nnoremap <tab> :tabn<Enter> 
inoremap <tab> :tabn<Enter> 

nnoremap <C-t> :tabnew<Enter> 
inoremap <C-t> :tabnew<Enter> 

