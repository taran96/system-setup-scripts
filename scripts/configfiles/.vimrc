set number
set encoding=utf-8
syntax enable

set backspace=indent,eol,start
set fileformat=unix

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-H> <C-W><C-H>
nnoremap <C-L> <C-W><C-L>

let python_highlight_all=1


set tabstop=2
set softtabstop=2
set shiftwidth=2

set hidden
set nocompatible

call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'scrooloose/syntastic'
Plug 'nvie/vim-flake8'
Plug 'rakr/vim-one'
Plug 'morhetz/gruvbox'
Plug 'kien/ctrlp.vim'

call plug#end()

colorscheme gruvbox
set background=dark
let g:one_allow_italics = 1

let g:airline_theme="gruvbox"
let g:airline#extensions#tabline#enabled=1


