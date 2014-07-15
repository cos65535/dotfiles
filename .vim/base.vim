set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,iso-2022-jp,euc-jp,cp932
set fileformats=mac,unix,dos
set nocompatible
set number
set showmode
set title
set ruler
set showcmd
set showmatch
set hlsearch
set backspace=start,eol,indent
set laststatus=2
set statusline=%f\ [%{&fenc==''?&enc:&fenc}][%{&ff}]%=%8l:%c%8P

syntax on
filetype on
filetype plugin indent on
set smartindent
set expandtab
set ts=4 sw=4 sts=0

highlight Comment ctermfg=lightblue guifg=#0000ff

