"Set wsl as the shell on windows instead of cmd.exe
"Change to cmd.exe before running :diffthis
if has("windows")
  set shell=C:\Windows\Sysnative\wsl.exe
  set shellpipe=|
  set shellredir=>
  set shellcmdflag=
endif

"Custom settings {{{
"===================
set nocompatible        " be iMproved, required
set nowrap
set tabstop=4
set noexpandtab
set shiftwidth=4
set smartindent
set textwidth=120
set cursorline
set number
set relativenumber
set hlsearch
set hidden
set smartcase
set incsearch
set scrolloff=1
"set autochdir
set autoread
set wildmenu
syntax on
set clipboard=unnamed
set ruler
"Consider hypenated words as one
set iskeyword+=-
set winaltkeys=yes
set textwidth=180
set backspace=indent,eol,start
set nrformats=bin,octal,hex,alpha
"Always show status line
set laststatus=2
if has("gui_macvim")
  set guifont=Monaco:h11
else
  set guifont=Consolas:h11,Courier\ New:h10
endif
set background=dark
if has("gui_macvim")
  colorscheme jellybeans
elseif has("gui_running")
  colorscheme jellybeans
else
  colorscheme koehler
endif
" Remove top menu/tool bars
set guioptions-=m
set guioptions-=m
set guioptions-=r
set guioptions-=L
set guioptions-=e
"Disable all bells cause they are annoying
set belloff=all

filetype on
filetype plugin indent on
let g:netrw_banner=0
let g:netrw_liststyle=0

" ctrl p settings
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_open_new_file = 'v'
let g:ctrlp_custom_ignore = {
      \ 'dir':  'node_modules$'
      \ }

set backup
set backupdir=/Users/devnarayan/Documents/vim_bak,.
set directory=/Users/devnarayan/Documents/vim_bak,.
"}}}

"Custom mappings {{{
"====================
"Toggle folds
nnoremap <space> za
"Close all folds
nnoremap <c-space> zM
"Open all folds
nnoremap <s-space> zR
"Move tabs left or right
nnoremap <F3> :tabmove -1<CR>
nnoremap <F4> :tabmove +1<CR>
"Clear search
nnoremap <c-h> :nohl<cr>
"Open/close quickfix buffer
nnoremap T :10copen<cr>
nnoremap Y :cclose<cr>
"search occurrences of selected text
vnoremap * l<esc>`<y`>/<c-r>0<cr>
vnoremap # l<esc>`<y`>?<c-r>0<cr>
"Easy esc in insert mode
inoremap <s-CR> <esc>

let mapleader = "_"
"Open vimrc in a new vertical split
nnoremap <leader>ev :vsp $MYVIMRC<cr>
"source vimrc
nnoremap <leader>sv :source $MYVIMRC<cr>

"Save file with sudo
"ca w!! w !sudo tee >/dev/null "%"

"Rename a word then '.' can be used to rename other occurrences
nnoremap <leader>r *Ncgn

"add == sequence to the bottom of a line
"store the current search term in temp so that it can be restored after
"running substitute command
nnoremap <leader>= :let temp=@/<cr>Vyp:s/./=/g<cr>:let @/=temp<cr>

"Type %% in Ex mode to enter current file's path. This is useful when autochdir is turned off
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'
"}}}

let mapleader = "_"
let maplocalleader = "|"
"CPP filetype autocmds {{{
augroup filetype_cpp
  "Clears autocmd with same group name. Sourcing this multiple times won't cause weirdness
  autocmd!
  "Comment shortcut
  autocmd FileType cpp nnoremap <buffer> <localleader>c I//<esc>
  "Abbreviation for shared_ptr
  autocmd FileType cpp iabbrev <buffer> s_ptr std::shared_ptr
  "Remove trailing whitespace
  autocmd BufWritePre *.cpp,*.h :silent! %s/\s\+$//<cr>
  autocmd FileType cpp setlocal foldmethod=indent foldnestmax=3
  autocmd FileType cpp set suffixesadd=.cpp,.h
augroup END
"}}}

"Java filetype autocmds {{{
augroup filetype_java
  "Clears autocmd with same group name. Sourcing this multiple times won't cause weirdness
  autocmd!
  "Remove trailing whitespace
  autocmd BufWritePre *.java :silent! %s/\s\+$//<cr>
  autocmd FileType java setlocal expandtab
  "Automatically add closing quotes
  autocmd FileType java inoremap <buffer> " ""<esc>i
  "Set fold method to indent
  autocmd FileType java setlocal foldmethod=indent foldnestmax=3
augroup END
"}}}

"lisp filetype autocmds {{{
augroup filetype_lisp
  "Clears autocmd with same group name. Sourcing this multiple times won't cause weirdness
  autocmd!
  autocmd FileType lisp setlocal ts=2 sw=2 expandtab
  "Remove trailing whitespace
  autocmd BufWritePre *.lisp :silent! %s/\s\+$//<cr>
  "Folding method is indentation
  autocmd FileType lisp setlocal foldmethod=indent foldnestmax=3
  "Modified auto-pairs (used in auto-pair Plugin)
  autocmd FileType lisp let b:AutoPairs = {'(':')', '[':']', '{':'}','"':'"', '`':'`'}
augroup END
"}}}

"js filetype autocmds {{{
augroup filetype_js
  autocmd!
  autocmd BufRead,BufNew *.ejs,*.ts setlocal filetype=javascript
  autocmd BufWritePre *.ejs,*.ts,*.js :silent! %s/\s\+$//<cr>
  "Add relevant suffixes so that the 'gf' command can work
  autocmd FileType javascript setlocal suffixesadd=.js,.json,.ts,.ejs
  autocmd FileType javascript setlocal ts=2 sw=2 expandtab
  autocmd FileType javascript setlocal foldmethod=indent foldnestmax=3
  autocmd FileType javascript nnoremap <buffer> <leader>z f{<s-v>%zf
  autocmd FileType javascript let g:ctrlp_custom_ignore = {
        \ 'dir':  'node_modules$'
        \ }
augroup END
"}}}

"racket filetype autocmds {{{
augroup filetype_racket
  autocmd!
  autocmd FileType scheme setlocal ts=2 sw=2 expandtab
  autocmd FileType scheme setlocal foldmethod=indent foldnestmax=3
  "Modified auto-pairs (used in auto-pair Plugin)
  autocmd FileType scheme let b:AutoPairs = {'(':')', '[':']', '{':'}','"':'"', '`':'`'}
  "Remove trailing whitespace
  autocmd BufWritePre *.rkt :silent! %s/\s\+$//<cr>
augroup END
"}}}

"xml filetype autocmds {{{
augroup filetype_xml
  autocmd!
  autocmd BufRead,BufNew *.xml setlocal filetype=xml
  autocmd FileType xml setlocal ts=2 sw=2 expandtab
augroup END
"}}}

"json filetype autocmds {{{
augroup filetype_json
  autocmd!
  autocmd FileType json setlocal ts=2 sw=2 noexpandtab
augroup END

"}}}
"Ruby filetype autocmds {{{
augroup filetype_rb
  autocmd!
  autocmd BufRead,BufNew *.rb setlocal filetype=ruby
  autocmd BufRead,BufNew *.erb setlocal filetype=eruby
  autocmd FileType ruby setlocal ts=2 sw=2 expandtab
  autocmd FileType eruby setlocal ts=2 sw=2 expandtab
augroup END
"}}}

"css filetype autocmds {{{
augroup filetype_css
  autocmd!
  autocmd BufRead,BufNew *.scss setlocal filetype=css
  autocmd FileType css setlocal ts=2 sw=2 expandtab
augroup END
"}}}

"html filetype_html {{{
augroup filetype_html
  autocmd!
  autocmd FileType html setlocal ts=2 sw=2 expandtab
  autocmd FileType html setlocal foldmethod=indent
  autocmd FileType html nnoremap <buffer> <leader>/ $F<v%yo<esc>pF<a/<esc>==O
augroup END
"}}}

" Vim filetype autocmds {{{
augroup filetype_vim
  autocmd!
  "Folding in vim files
  autocmd FileType vim setlocal foldmethod=marker
  autocmd FileType vim setlocal ts=2 sw=2 expandtab
augroup END
" }}}

" Custom variables {{{
" Shortcuts to open frequently used directories
let DIR = "path/to/directory"
cabbrev DIR exec ":e ".DIR
" }}}
