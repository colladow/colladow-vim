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

colorscheme molokai_dark

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

map <C-n> :NERDTreeToggle<CR>
map <C-o> :NERDTreeFind<CR>

set colorcolumn=80

let g:jsx_ext_required=0


let local_eslint = findfile('node_modules/.bin/eslint', '.;')
if executable(local_eslint)
  let g:syntastic_javascript_eslint_exec = local_eslint
endif

let g:CommandTFileScanner="git"

function! CurrentAndParent()
  let path = split(expand('%p'), '/')
  let label = join(path[-2:-1], '/')

  if len(path) == 0
    let label = 'suh du'
  endif

  if label == ''
    let label = path[-1]
  endif

  if &mod == 1
    let label = label . ' [+]'
  endif

  return label
endfunction

autocmd VimEnter * set guitablabel=%{CurrentAndParent()}
