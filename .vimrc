if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" Declare the list of plugins.

Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" List ends here. Plugins become visible to Vim after this call.
call plug#end()

"enabling mouse support 
:set mouse=a

"seting utf=8 encoding for NERDtree to work properly
:set encoding=utf-8 

"fuzy search
nnoremap <C-p> :FZF<Enter> 
inoremap <C-p> :FZF<Enter> 

"File explorer
nnoremap F :NERDTree<Enter>

"tab moving/managing shortcuts
nnoremap <tab> :tabn<Enter> 
nnoremap <C-t> :tabnew<Enter> 
inoremap <C-t> :tabnew<Enter> 

"disable ex mode
:map Q <Nop> 

"traditional copy/paste key bindings  
vnoremap <C-c> "*y :let @+=@*<CR> 
:map <C-v> "+P

"fuzzy search of ctags
nnoremap <C-c> :Tags<Enter> 
inoremap <C-c> :Tags<Enter> 

"Backspace as a delete in visualmode
vnoremap <BS> d

