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
Plug 'majutsushi/tagbar'
Plug 'lvht/tagbar-markdown' "php have to be in the $PATH
Plug 'junegunn/goyo.vim'
Plug 'tpope/vim-commentary'
Plug 'w0rp/ale' "linting engine - works for many languages and it's based on third-party linting tools like clang, clang-format or autopep8
" List ends here. Plugins become visible to Vim after this call.
call plug#end()

"enabling mouse support 
:set mouse=a

"setting utf=8 encoding for NERDtree to work properly
:set encoding=utf-8 

"ignore case when searching
set ignorecase

"use incremental search
set incsearch 

"set 7 lines to the cursor - when moving vertically using j/k
set so=7

"fuzzy search
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

"English spell check
map <F7> :setlocal spell! spelllang=en_us<CR>

"Tagbar
nmap <F8> :TagbarToggle<Enter>

"Enabling/disabling distraction-free writing mode
nmap <F9> :Goyo<Enter>

