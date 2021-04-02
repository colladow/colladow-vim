set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'wincent/command-t'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-fugitive'
Plugin 'pangloss/vim-javascript'
Plugin 'groenewege/vim-less'
Plugin 'tpope/vim-surround'
Plugin 'fatih/vim-go'
Plugin 'dense-analysis/ale'
Plugin 'leafgarland/typescript-vim'
Plugin 'peitalin/vim-jsx-typescript'
Plugin 'maxmellon/vim-jsx-pretty'
Plugin 'jparise/vim-graphql'
Plugin 'neoclide/coc.nvim', { 'bracnh': 'release' }
Plugin 'styled-components/vim-styled-components'

call vundle#end()

filetype plugin indent on
filetype plugin on

syntax on

set ts=2
syntax enable
set shiftwidth=2
set expandtab
set autoindent
set backspace=indent,eol,start
set number
set wildignore=*/node_modules

colorscheme molokai_dark

set guioptions-=T
set guioptions-=r
set guioptions-=L
" set guifont=Menlo\ 14
set guifont=Menlo\ 18

autocmd BufRead,BufNewFile *.py set ts=4
autocmd BufRead,BufNewFile *.py set shiftwidth=4
autocmd BufRead,BufNewFile *.py set expandtab

autocmd BufRead,BufNewFile *.go set noexpandtab
autocmd BufRead,BufNewFile *.go set ts=4
autocmd BufRead,BufNewFile *.go set shiftwidth=4
autocmd BufRead,BufNewFile *.go nnoremap <F2> :GoTest<CR>
autocmd BufRead,BufNewFile *.go nnoremap <F3> :GoVet<CR>

autocmd BufRead,BufNewFile *.ts set filetype=typescript.tsx
autocmd BufRead,BufNewFile *.tsx set filetype=typescript.tsx

map <C-n> :NERDTreeToggle<CR>
map <C-o> :NERDTreeFind<CR>
map <C-f> :CommandTFlush<CR>
map <C-t> :tabnew<CR>
map ` :tabnext<CR>
map ~ :tabprev<CR>
vmap <C-c> "+y
imap <C-v> <C-r>+
imap <C-BS> <C-W>

set colorcolumn=80

let g:jsx_ext_required=0
let g:CommandTWildIgnore='*/node_modules'
let g:ale_linters = {
      \'javascript': ['eslint'],
      \}
let g:CommandTTraverseSCM='pwd'
let g:coc_global_extensions=[ 'coc-tsserver' ]

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

set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

" COC
" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()


set hidden
set cmdheight=2
set updatetime=300
set shortmess+=c
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
      \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%t\|%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
