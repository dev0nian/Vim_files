set nocompatible
set tabstop=4
set shiftwidth=4
set smartindent
set cursorline
set number
set hlsearch
set ignorecase
set incsearch
set autochdir
colorscheme koehler 
set wildmenu
set syntax=on
set clipboard=unnamed
set ruler
set relativenumber

filetype on
filetype plugin on

set winaltkeys=yes
set backspace=indent,eol,start

"set guifont=Consolas:h11

"let g:netrw_menu=0
let g:netrw_banner=0
let g:netrw_liststyle=3
let g:netrw_winsize=30

"Toggle folds
nnoremap <space> za

let mapleader = "-"
"Open vimrc in a new vertical split
nnoremap <leader>ev :vsp $MYVIMRC<cr>
"source vimrc
nnoremap <leader>sv :source $MYVIMRC<cr>

"add == sequence to the bottom of a line
"store the current search term in temp so that it can be restored after
"running substitute command
nnoremap -= :let temp=@/<cr>Vyp:s/./=/g<cr>:let @/=temp<cr>

let mapleader = "cs"
"surround word with quotes/braces -------------------- {{{
nnoremap <leader>" viW<esc>a"<esc>Bi"<esc>f"
nnoremap <leader>( viW<esc>a)<esc>Bi(<esc>f)
nnoremap <leader>) viW<esc>a)<esc>Bi(<esc>f)
nnoremap <leader>{ viW<esc>a}<esc>Bi{<esc>f}
nnoremap <leader>} viW<esc>a}<esc>Bi{<esc>f}
nnoremap <leader>[ viW<esc>a]<esc>Bi[<esc>f]
nnoremap <leader>] viW<esc>a]<esc>Bi[<esc>f]
"}}}

"surround selected text with quotes/braces -------------------- {{{
vnoremap <leader>" <esc>`<i"<esc>`>la"<esc>
vnoremap <leader>( <esc>`<i(<esc>`>la)<esc>
vnoremap <leader>) <esc>`<i(<esc>`>la)<esc>
vnoremap <leader>{ <esc>`<i{<esc>`>la}<esc>
vnoremap <leader>} <esc>`<i{<esc>`>la}<esc>
vnoremap <leader>[ <esc>`<i[<esc>`>la]<esc>
vnoremap <leader>] <esc>`<i[<esc>`>la]<esc>
"}}}

"run cygwin commands from vim
"set shell=C:\cygwin64\bin\bash.exe\ -login
"set shellcmdflag=-c
"set shellquote=\"

let localleader = "\\"
"CPP filetype autocmds -------------------- {{{
augroup filetype_cpp
	autocmd!
	"Comment shortcut
	autocmd FileType cpp nnoremap <buffer> <localleader>c I//<esc>
	"Abbreviation for shared_ptr
	autocmd FileType cpp iabbrev s_ptr std::shared_ptr
augroup END
"}}}

" Vim filetype autocmds ------------------- {{{
augroup filetype_vim
	autocmd!
	"Folding in vim files
	autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}
