call pathogen#infect()

filetype plugin indent on
syntax on

set ts=2
syntax enable
set shiftwidth=2
set expandtab
set autoindent
set backspace=indent,eol,start
set number
set wildignore=*node_modules/**,*bower_components/**

filetype plugin on
filetype plugin indent on

colorscheme vividchalk

set guioptions-=T
set guioptions-=r
set guioptions-=L
set guifont=Menlo:h16

autocmd BufRead,BufNewFile *.py set ts=4
autocmd BufRead,BufNewFile *.py set shiftwidth=4
autocmd BufRead,BufNewFile *.py set expandtab

autocmd BufRead,BufNewFile *.go set noexpandtab
autocmd BufRead,BufNewFile *.go set ts=4
autocmd BufRead,BufNewFile *.go set shiftwidth=4
