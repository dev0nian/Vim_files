set nocompatible
set tabstop=4
set shiftwidth=4
set smartindent
set cursorline
set number
set hlsearch
set ic
set is
set autochdir
colorscheme koehler 
set wildmenu
set syntax=on
set clipboard=unnamed
set ruler

filetype on
filetype plugin on

set winaltkeys=yes
set backspace=indent,eol,start

set guifont=Consolas:h11

"let g:netrw_menu=0
let g:netrw_banner=0
let g:netrw_liststyle=3
let g:netrw_winsize=30

let mapleader = "-"
"Open vimrc in a new vertical split
nnoremap <leader>ev :vsp $MYVIMRC<cr>
"source vimrc
nnoremap <leader>sv :source $MYVIMRC<cr>

"add == sequence to the bottom of a line
nnoremap -= Vyp:s/./=/g<cr>:let @/=""<cr>

let mapleader = "cs"
"surround word with quotes/braces
nnoremap <leader>" viW<esc>a"<esc>Bi"<esc>f"
nnoremap <leader>( viW<esc>a)<esc>Bi(<esc>f)
nnoremap <leader>) viW<esc>a)<esc>Bi(<esc>f)
nnoremap <leader>{ viW<esc>a}<esc>Bi{<esc>f}
nnoremap <leader>} viW<esc>a}<esc>Bi{<esc>f}
nnoremap <leader>[ viW<esc>a]<esc>Bi[<esc>f]
nnoremap <leader>] viW<esc>a]<esc>Bi[<esc>f]
"surround selected text with quotes/braces
vnoremap <leader>" <esc>`<i"<esc>`>la"<esc>
vnoremap <leader>( <esc>`<i(<esc>`>la)<esc>
vnoremap <leader>) <esc>`<i(<esc>`>la)<esc>
vnoremap <leader>{ <esc>`<i{<esc>`>la}<esc>
vnoremap <leader>} <esc>`<i{<esc>`>la}<esc>
vnoremap <leader>[ <esc>`<i[<esc>`>la]<esc>
vnoremap <leader>] <esc>`<i[<esc>`>la]<esc>

"run cygwin commands from vim
"set shell=C:\cygwin64\bin\bash.exe\ -login
"set shellcmdflag=-c
"set shellquote=\"

