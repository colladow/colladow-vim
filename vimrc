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

filetype plugin on
filetype plugin indent on

colorscheme molokai_dark

set guioptions-=T
set guioptions-=r
set guioptions-=L
" OSX set guifont=Menlo:h16
set guifont=Consolas\ 16

set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

autocmd BufRead,BufNewFile *.py set ts=4
autocmd BufRead,BufNewFile *.py set shiftwidth=4
autocmd BufRead,BufNewFile *.py set expandtab

autocmd BufRead,BufNewFile *.go set noexpandtab
autocmd BufRead,BufNewFile *.go set ts=4
autocmd BufRead,BufNewFile *.go set shiftwidth=4
autocmd BufRead,BufNewFile *.go map <F2> :GoTest<CR>
autocmd BufRead,BufNewFile *.go map <F3> :GoVet<CR>
autocmd BufRead,BufNewFile *.go nnoremap <C-t> :tabnew<CR>

map <C-n> :NERDTreeToggle<CR>
map <C-o> :NERDTreeFind<CR>
map <C-f> :CommandTFlush<CR>
map <C-t> :tabnew<CR>
nmap ` :tabnext<CR>
nmap ~ :tabprev<CR>
vmap <C-c> "+y
imap <C-v> <C-r>+

set colorcolumn=80

let g:jsx_ext_required=0
let g:CommandTWildIgnore='*/node_modules'
let g:ale_linters = {
      \'javascript': ['eslint'],
      \}

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
