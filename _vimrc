"Vundle boilerplate {{{
set nocompatible              " be iMproved, required
filetype off                  " required
" set the runtime path to include Vundle and initialize
if has("gui_macvim") || has("unix")
	set rtp+=~/.vim/bundle/Vundle.vim
	call vundle#begin('$HOME/.vim/bundle/')
elseif has("gui_running")
	set rtp+=~/vimfiles/bundle/Vundle.vim
	call vundle#begin('$HOME/vimfiles/bundle/')
endif
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
" let Vundle manage Vundle, required
"}}}
"Plugins {{{
Plugin 'VundleVim/Vundle.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'jacoborus/tender.vim'
Plugin 'tpope/vim-surround'
Plugin 'goonzoid/vim-reprocessed'
Plugin 'ctrlpvim/ctrlp.vim'
"}}}
" More Vundle boilerplate {{{
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
"}}}

"Custom settings {{{
"===================
set tabstop=4
set noexpandtab
set shiftwidth=4
set smartindent
set textwidth=120
set cursorline
set number
set relativenumber
set hlsearch
set ignorecase
set incsearch
set autochdir
set wildmenu
syntax on
set clipboard=unnamed
set ruler
set winaltkeys=yes
set backspace=indent,eol,start
"Always show status line
set laststatus=2
if has("gui_macvim")
	set guifont=Monaco:h11
else
	set guifont=Consolas:h11,Courier\ New:h10
endif
set background=dark
"Solarized doesn't do well in terminal. Set koehler there
if has("gui_macvim")
	colorscheme tender 
elseif has("gui_running")
	colorscheme tender
else
	colorscheme koehler
endif
" Remove top menu/tool bars
set guioptions-=m
set guioptions-=T

filetype on
filetype plugin on
let g:netrw_banner=0
let g:netrw_liststyle=0

" ctrl p settings
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_open_new_file = 'v'

"set backup
"set backupdir=C:\Users\Dev\AppData\Local\Temp\
"set dir=C:\Users\Dev\AppData\Local\Temp\
"}}}

"Custom mappings {{{
"====================
"Toggle folds
nnoremap <space> za
"Close all folds
nnoremap <c-space> zM
"Open all folds
nnoremap <s-space> zR
"Clear search
cnoremap cls let @/=""
"search occurrences of selected text
vnoremap * l<esc>`<y`>/<c-r>0<cr>
vnoremap # l<esc>`<y`>?<c-r>0<cr>

let mapleader = "_"
"Open vimrc in a new vertical split
nnoremap <leader>ev :vsp $MYVIMRC<cr>
"source vimrc
nnoremap <leader>sv :source $MYVIMRC<cr>

"add == sequence to the bottom of a line
"store the current search term in temp so that it can be restored after
"running substitute command
nnoremap <leader>= :let temp=@/<cr>Vyp:s/./=/g<cr>:let @/=temp<cr>
"}}}

"run cygwin commands from vim {{{
"set shell=C:\cygwin64\bin\bash.exe\ -login
"set shellcmdflag=-c
"set shellquote=\"
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
	"Automatically add closing braces
	autocmd FileType cpp iabbrev <buffer> { {<esc>o}<esc>kA
augroup END
"}}}

"js filetype autocmds {{{
augroup filetype_js
	autocmd!
	autocmd BufRead,BufNew *.ejs set filetype=javascript
	autocmd FileType javascript set ts=2 sw=2 expandtab
	autocmd FileType html inoremap <buffer> " ""<esc>i
	autocmd FileType html inoremap <buffer> ( ()<esc>i
augroup END
"}}}

"html filetype_html {{{
augroup filetype_html
	autocmd!
	autocmd FileType html set ts=2 sw=2 expandtab
	autocmd FileType html nnoremap <buffer> <leader>/ $F<v%yo<esc>pF<a/<esc>==O
	autocmd FileType html inoremap <buffer> < <><esc>i
	autocmd FileType html inoremap <buffer> " ""<esc>i
	autocmd FileType html inoremap <buffer> ( ()<esc>i
augroup END
"}}}

" Vim filetype autocmds {{{
augroup filetype_vim
	autocmd!
	"Folding in vim files
	autocmd FileType vim setlocal foldmethod=marker
	"automatically add endfunction to vim functions
	autocmd FileType vim iabbrev <buffer> function function<esc>oendfunction<esc>kA
	autocmd FileType vim iabbrev <buffer> if if<esc>oendif<esc>kA
augroup END
" }}}
