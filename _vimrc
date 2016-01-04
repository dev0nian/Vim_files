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
"}}}
" More Vundle boilerplate {{{
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
"}}}

"Custom settings {{{
"===================
set tabstop=4
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
if has("gui_macvim")
	set guifont=Monaco:h11
else
	set guifont=Consolas:h11,Courier\ New:h10
endif
set background=dark
"Solarized doesn't do well in terminal. Set koehler there
if has("gui_macvim")
	colorscheme solarized 
elseif has("gui_running")
	colorscheme solarized
else
	colorscheme koehler
endif

filetype on
filetype plugin on
let g:netrw_banner=0
let g:netrw_liststyle=0
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

let mapleader = "-"
"Open vimrc in a new vertical split
nnoremap <leader>ev :vsp $MYVIMRC<cr>
"source vimrc
nnoremap <leader>sv :source $MYVIMRC<cr>

"add == sequence to the bottom of a line
"store the current search term in temp so that it can be restored after
"running substitute command
nnoremap -= :let temp=@/<cr>Vyp:s/./=/g<cr>:let @/=temp<cr>
"}}}

"surround word with quotes/braces {{{
let mapleader = "cs"
nnoremap <leader>" viW<esc>a"<esc>Bi"<esc>f"
nnoremap <leader>( viW<esc>a)<esc>Bi(<esc>f)
nnoremap <leader>) viW<esc>a)<esc>Bi(<esc>f)
nnoremap <leader>{ viW<esc>a}<esc>Bi{<esc>f}
nnoremap <leader>} viW<esc>a}<esc>Bi{<esc>f}
nnoremap <leader>[ viW<esc>a]<esc>Bi[<esc>f]
nnoremap <leader>] viW<esc>a]<esc>Bi[<esc>f]
"}}}

"surround selected text with quotes/braces {{{
vnoremap <leader>" <esc>`<i"<esc>`>la"<esc>
vnoremap <leader>( <esc>`<i(<esc>`>la)<esc>
vnoremap <leader>) <esc>`<i(<esc>`>la)<esc>
vnoremap <leader>{ <esc>`<i{<esc>`>la}<esc>
vnoremap <leader>} <esc>`<i{<esc>`>la}<esc>
vnoremap <leader>[ <esc>`<i[<esc>`>la]<esc>
vnoremap <leader>] <esc>`<i[<esc>`>la]<esc>
"}}}

"run cygwin commands from vim {{{
"set shell=C:\cygwin64\bin\bash.exe\ -login
"set shellcmdflag=-c
"set shellquote=\"
"}}}

"CPP filetype autocmds {{{
augroup filetype_cpp
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
