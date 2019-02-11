if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" Declare the list of plugins.

Plug 'Valloric/YouCompleteMe', { 'do': './install.py --all' } " requires: clang(c++), mono(C#) etc.
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'majutsushi/tagbar'
Plug 'lvht/tagbar-markdown', {'for': 'markdown'} "php have to be in the $PATH
Plug 'junegunn/goyo.vim'
Plug 'tpope/vim-commentary'
Plug 'w0rp/ale' "linting engine - works for many languages and it's based on third-party linting tools like clang, clang-format or autopep8
Plug 'mhinz/vim-startify'
Plug 'simnalamburt/vim-mundo'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'farmergreg/vim-lastplace'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'tomasiser/vim-code-dark' "
Plug 'morhetz/gruvbox'
Plug 'NLKNguyen/papercolor-theme'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown', {'for': 'markdown'}
Plug 'rhysd/vim-clang-format' " requires to have clang-format installed and have .clang-format file defined
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs' "no longer actively maintained
Plug 'machakann/vim-highlightedyank' "make the yanked region highlighted
Plug 'haya14busa/vim-edgemotion'
Plug 'simeji/winresizer' "ctrl+e for windows resize mode
Plug 'airblade/vim-gitgutter' "shows which lines have been added, modified, or removed in sign column
Plug 'wincent/terminus'
Plug 'ervandew/matchem' "auto adds closing quotes, parens, brackets, curlies 
Plug 'kergoth/vim-bitbake', {'for': 'bitbake'} "Syntax highlightinf for bitbake tool(bb,bblasses and inc files)
Plug 'azadkuh/vim-cmus' "plugin for cmus integration inside vim 
Plug 'zivyangll/git-blame.vim' "shows git blame information in the status bar for the currently selected line (default binding is <Leader>s)
Plug 'google/vim-searchindex' "shows how many times does a search pattern occur in the current buffer
Plug 'romainl/vim-cool' "disables search highlighting when you are done searching and re-enables it when you search again
Plug 'yuttie/comfortable-motion.vim' "provides smooth scrolling 
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
Plug 'vim-scripts/vim-auto-save'
Plug 'skywind3000/asyncrun.vim'
" List ends here. Plugins become visible to Vim after this call.
call plug#end()

" code dark colorscheme for C/C++
autocmd BufEnter *.cpp colorscheme codedark 
autocmd BufEnter *.c colorscheme codedark 
autocmd BufEnter *.hpp colorscheme codedark 
autocmd BufEnter *.h colorscheme codedark 

" dark gruvbox colorscheme for Python, Java and HTML
autocmd BufEnter *.py set background=dark | colorscheme gruvbox
autocmd BufEnter *.java set background=dark | colorscheme gruvbox
autocmd BufEnter *.html set background=dark | colorscheme gruvbox

" dark papercolor colorscheme for Markdown and TeX
autocmd BufEnter *.md set background=dark | colorscheme PaperColor
autocmd BufEnter *.tex set background=dark | colorscheme PaperColor

"set '#' as a deafult comment for cmake files
autocmd FileType cmake setlocal commentstring=#\ %s

"Show diff when editing git commit messages
au FileType gitcommit DiffGitCached

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

"no swap files
set noswapfile

"Enable persistent undo so that undo history persists across vim sessions
set undofile

"Display command line’s tab complete options as a menu.
set wildmenu

"Puts new vsplit windows to the right of the current
set splitright

"Puts new split windows to the bottom of the current
set splitbelow  

"update time set to 100 (default 4000 = 4 sec) for gitguter to by more snappy 
set updatetime=100

"set highlight all search pattern matches
set hlsearch

"A file that matches with one of these patterns is ignored when expanding wildcards, completing file or directory names
set wildignore+=*.pyc,*.o,*.obj,*.svn,*.swp,*.class

"let nerd tree use wildignore as a list of file extensions to ignore
let NERDTreeRespectWildIgnore=1

"gitguter disable by default 
let g:gitgutter_enabled = 0 

"disable default text folding for markdown 
let g:vim_markdown_folding_disabled = 1

"Needed for older version of Vim (lower than version 8.0.1394) for highlighted
"yank to work
if !exists('##TextYankPost')
	  map y <Plug>(highlightedyank)
 endif

"highlight after yank set to 200 milliseconds
let g:highlightedyank_highlight_duration = 200

"prevent the plugin from overwriting default key mappings (C-d, C-u)
let g:comfortable_motion_no_default_key_mappings = 1

"set space as smooth scroll down like in modern web browsers
noremap <silent> <Space> :call comfortable_motion#flick(40)<CR>

"set control plus space as scroll up
noremap <silent> <c-@> :call comfortable_motion#flick(-40)<CR>

"Enable auto save from the start
let g:auto_save = 1 

"Disable auto save in insert mode
let g:auto_save_in_insert_mode = 0

" " let g:livepreview_previewer = 'mupdf'
let g:livepreview_cursorhold_recompile = 0
" let g:auto_save_no_updatetime = 1 

"Height of quickfix window (output of Asnych commands)
:let g:asyncrun_open = 8

"fuzzy search of files in workspace in normal and insert mode
nnoremap <C-p> :FZF<Enter> 
inoremap <C-p> :FZF<Enter> 

"semicolon as a fuzzy search of vim commands in normal mode
nnoremap ; :Commands<Enter>

"File explorer
nnoremap F :NERDTreeTabsToggle<Enter>

"tab moving/managing shortcuts
nnoremap <tab> :tabn<Enter> 
nnoremap <C-t> :tabnew<Enter> 
inoremap <C-t> :tabnew<Enter> 

"disable ex mode
:map Q <Nop> 

"traditional copy/paste key bindings  
vnoremap <C-c> "*y :let @+=@*<CR> 
:map <C-v> "+P

"pasting in insert mode with jump to the end of pasted text 
imap <C-v> <Esc>"+p']A

"fuzzy search of ctags
nnoremap <C-c> :Tags<Enter> 
inoremap <C-c> :Tags<Enter> 

"Backspace as a delete in visualmode
vnoremap <BS> d

"Capital J as motion like j but stops at edge only
map J <Plug>(edgemotion-j)

"Capital K as motion like k but stops at edge only
map K <Plug>(edgemotion-k)

"Ctrl-a to expand snippet 
let g:UltiSnipsExpandTrigger="<c-a>"

"Ctrl-b to jump to next tag in snippet 
let g:UltiSnipsJumpForwardTrigger="<c-b>"

"Ctrl-z to jump back to previous snippet tag
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

"Enables auto closing of the preview window after acceptance of offered completion string.
let g:ycm_autoclose_preview_window_after_completion=1

"Go to definition or declaration provided by YCM completer 
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

"English spell check
map <F7> :setlocal spell! spelllang=en_us<CR>

"Tagbar
nmap <F8> :TagbarToggle<Enter>

"Enabling/disabling distraction-free writing mode
nmap <F9> :Goyo<Enter>

"Enabling/disabling line numbers and gitguter diff lines
nmap <F10> :set invnumber<Enter>:GitGutterToggle<Enter>

"Toggling mundo plugin to visualize the Vim undo tree.
nmap <F12> :MundoToggle<Enter>

