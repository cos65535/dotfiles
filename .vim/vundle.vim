set nocompatible
filetype off
set rtp+=~/.vim/vundle.git/
call vundle#rc()
" original repos on github
Bundle 'tpope/vim-fugitive'
" vim-scripts repos
Bundle 'rails.vim'
" non github repos
"Bundle 'git://git.wincent.com/command-t.git'

" Plugins
"Bundle 'gmarik/vundle'
Bundle 'Shougo/neocomplcache'
Bundle 'Shougo/unite.vim'
Bundle 'inkpot'
Bundle 'tomtom/tcomment_vim'
"Bundle 'Pydiction'


filetype plugin indent on
