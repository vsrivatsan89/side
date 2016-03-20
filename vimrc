" Vim doesn't work with fish yet
"
if $SHELL =~ 'fish'
  set shell=/bin/bash
endif

" Turn the error bell off!!
set noeb vb t_vb=

set nocompatible              " be iMproved, required
set hidden
filetype off                  " required

"Less temp files
set backupdir=~/.vim/backup_files//
set directory=~/.vim/swap_files//
set undodir=~/.vim/undo_files//

set splitright
let mapleader = ","
" Window short cuts
map <leader>h :wincmd h<CR>
map <leader>j :wincmd j<CR>
map <leader>k :wincmd k<CR>
map <leader>l :wincmd l<CR>
map <leader>c :wincmd c<CR>
map <leader>s :wincmd s<CR>
map <leader>v :wincmd v<CR>
map <leader>e :wincmd =<CR>
map <C-j> :wincmd <<CR>
map <C-l> :wincmd ><CR>

" Go one screen line down instead of an next end of line caracter
nmap j gj
nmap k gk

" Line number on
set number
" Fix alt key mapping for chromebooks
imap ≥ =>

" Reload .vimrc
map <leader>rv  :source ~/.vimrc<CR>

" Wrap text
set wrap
" Tab settings 4 spaces means more code
set tabstop=2
set expandtab
set shiftwidth=2
set autoindent 

" 2 esc to stop search
nnoremap <silent> <Esc><Esc> <Esc>:nohlsearch<CR><Esc>
" OS X thing for copy paste
set clipboard=unnamed
" Show status bar always
set laststatus=2

syntax enable
set background=dark
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

Plugin 'altercation/vim-colors-solarized'
let g:solarized_termcolors=256
colorscheme solarized


" Fish shell
Plugin 'dag/vim-fish'
" Set up :make to use fish for syntax checking.
compiler fish

" DelimitMage auto close tabes and quaots ect
Plugin 'Raimondi/delimitMate.git'
"

Plugin 'jlanzarotta/bufexplorer'


Plugin 'bling/vim-airline'
let g:airline#extensions#tabline#enabled = 1

"Syntastic
Plugin 'scrooloose/syntastic'

"NERDTree
Plugin 'scrooloose/nerdtree'

" NERDTree git plugin
Plugin 'Xuyuanp/nerdtree-git-plugin'

" NERDTree ctrl-n
map <C-n> :NERDTreeToggle<CR>

" C
Plugin 'vim-scripts/c.vim'

" Go
Plugin 'fatih/vim-go'

au BufRead,BufNewFile *.go set filetype=go
"let g:go_snippet_engine = "neosnippet"
" Go related mappings
au FileType go nmap <leader>gs <Plug>(go-implements)
au FileType go nmap <leader>gi <Plug>(go-info)
au FileType go nmap <leader>gd <Plug>(go-doc)
au FileType go nmap <leader>go <Plug>(go-doc)
au FileType go nmap <leader>gv <Plug>(go-doc-vertical)
au FileType go nmap <leader>gb <Plug>(go-doc-browser)
au FileType go nmap <leader>gr <Plug>(go-run)
au FileType go nmap <leader>gb <Plug>(go-build)
au FileType go nmap <leader>tt <Plug>(go-test)
au FileType go nmap <leader>gc <Plug>(go-coverage)
au FileType go nmap <leader>ds <Plug>(go-def-split)
au FileType go nmap <leader>dv <Plug>(go-def-vertical)
au FileType go nmap <leader>dt <Plug>(go-def-tab)
au FileType go nmap <leader>ge <Plug>(go-rename)

" Fix syntastic with go
"let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
"let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }
"Plugin 'garyburd/go-explorer'

" Rust
Plugin 'rust-lang/rust.vim'

" Lua
Plugin 'xolox/vim-lua-ftplugin'

" Nim
Plugin 'zah/nimrod.vim'
au BufRead,BufNewFile *.nim set filetype=nim
fun! JumpToDef()
  if exists("*GotoDefinition_" . &filetype)
    call GotoDefinition_{&filetype}()
  else
    exe "norm! \<C-]>"
  endif
endf

" Jump to tag
nn <M-g> :call JumpToDef()<cr>
ino <M-g> <esc>:call JumpToDef()<cr>i

" Dart
" https://github.com/dart-lang/dart-vim-plugin
Plugin 'dart-lang/dart-vim-plugin'
au BufRead,BufNewFile *.dart set filetype=dart
if has('vim_starting')
  set nocompatible
  set runtimepath+=~/.vim/bundle/dart-vim-plugin
endif
filetype plugin indent on

" Python
Plugin 'klen/python-mode'


" Javascript
Plugin 'pangloss/vim-javascript'
" Polymer
Plugin 'bendavis78/vim-polymer'

" Misc for lua
Plugin 'xolox/vim-misc'
" Sessions 
Plugin 'xolox/vim-session'
" Turn on session autoload already!!
let g:session_autoload = 1
let g:session_autosave = 1
let g:sesson_autosave_periodic = 1
let g:session_autosave = 'no'
" QML
"Plugin 'peterhoeg/vim-qml'

" csv
Plugin 'chrisbra/csv.vim'

" Git gutter
Plugin 'airblade/vim-gitgutter'

" Virtualenv
Plugin 'jmcantrell/vim-virtualenv'

" ctrl-p
"plugin 'kien/ctrlp.vim'
"

" Restructured text
Plugin 'Rykka/riv.vim'
"Plugin 'Rykka/clickable.vim'

" Vagrant
Plugin 'markcornick/vim-vagrant'

" Neocomplete
Plugin 'Shougo/neocomplete'
Plugin 'Shougo/neosnippet'
Plugin 'Shougo/neosnippet-snippets'
Plugin 'Shougo/neocomplete.vim'
Plugin 'Shougo/neocomplcache.vim'
Plugin 'Shougo/neobundle.vim'


Plugin 'Shougo/vimproc.vim'

if system('uname -o') =~ '^GNU/'
  let g:make = 'make'
endif
" Replacement for ctrlp
Plugin 'Shougo/unite.vim'
nnoremap <C-p> :Unite file_rec/async<cr>
nnoremap <space><space> :Unite file_rec/async<cr>

"Plugin 'mileszs/ack.vim'
nnoremap <space>/ :Unite grep:.<cr>
Plugin 'rking/ag.vim'
let g:unite_source_rec_async_command =
            \ 'ag --follow --nocolor --nogroup --hidden -g ""'

Plugin 'sjbach/lusty'
nnoremap <space>s :Unite -quick-match buffer<cr>

"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
"let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Enable heavy features.
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplcache#smart_close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplcache#close_popup() : "\<Space>"

" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left>  neocomplcache#close_popup() . "\<Left>"
"inoremap <expr><Right> neocomplcache#close_popup() . "\<Right>"
"inoremap <expr><Up>    neocomplcache#close_popup() . "\<Up>"
"inoremap <expr><Down>  neocomplcache#close_popup() . "\<Down>"
" Or set this.
"let g:neocomplcache_enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplcache_enable_insert_char_pre = 1

" AutoComplPop like behavior.
"let g:neocomplcache_enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplcache_enable_auto_select = 1
"let g:neocomplcache_disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
"autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
"autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
"autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
"autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplcache_force_omni_patterns')
  let g:neocomplcache_force_omni_patterns = {}
endif
let g:neocomplcache_force_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_force_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplcache_force_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplcache_force_omni_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

if has("gui_running")
  set background=dark
  set guioptions-=T         " Remove toolbar
  if has("gui_gtk2")
    "set guifont=Consolas\ 10
  elseif has("gui_macvim")
    set fuoptions=maxvert,maxhorz
    set guifont=Monaco:h16
    set fu
  elseif has("gui_win32")
    set guifont=Consolas:h11:cANSI
  endif
endif

" Extend vim via config file
let g:slide_vimrc = $HOME . '/.slide/vimrc'
if filereadable(!empty(glob(slide_vimrc)))
  source slide_vimrc
endif