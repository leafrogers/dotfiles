call plug#begin()
Plug 'airblade/vim-gitgutter'
Plug 'ap/vim-buftabline'
Plug 'ap/vim-css-color'
Plug 'chriskempson/base16-vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'heavenshell/vim-jsdoc', {
\	'for': ['javascript', 'javascript.jsx','typescript'],
\	'do': 'make install'
\ }
Plug 'itchyny/lightline.vim'
Plug 'itchyny/vim-gitbranch'
Plug 'janko/vim-test'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'preservim/nerdcommenter'
Plug 'preservim/nerdtree'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'tpope/vim-sensible'
call plug#end()

colorscheme base16-gruvbox-dark-medium

let g:buftabline_indicators = 1
let g:lightline = {
\	'active': {
\		'left': [ [ 'mode', 'paste' ], [ 'gitbranch' ], [ 'readonly' ] ],
\		'right': [ [ 'lineinfo' ], [ 'percent' ], [ 'linting'] ]
\	},
\	'component_function': {
\		'gitbranch': 'gitbranch#name',
\		'linting': 'coc#status'
\	},
\	'subseparator': { 'left': '│' }
\ }

" let g:node_client_debug = 1

let mapleader=','
let NERDSpaceDelims=1
let NERDTreeQuitOnOpen=1

nmap <leader>0 <Plug>BufTabLine.Go(-1)
nmap <leader>1 <Plug>BufTabLine.Go(1)
nmap <leader>2 <Plug>BufTabLine.Go(2)
nmap <leader>3 <Plug>BufTabLine.Go(3)
nmap <leader>4 <Plug>BufTabLine.Go(4)
nmap <leader>5 <Plug>BufTabLine.Go(5)
nmap <leader>6 <Plug>BufTabLine.Go(6)
nmap <leader>7 <Plug>BufTabLine.Go(7)
nmap <leader>8 <Plug>BufTabLine.Go(8)
nmap <leader>9 <Plug>BufTabLine.Go(9)

nnoremap <leader>/ :Rg<CR>
nnoremap <leader><Left> :bprev<CR>
nnoremap <leader><Right> :bnext<CR>
nnoremap <leader><Up> :bdelete<CR>
nnoremap <leader>a :<C-u>CocList diagnostics<CR>
nnoremap <leader>c<Space> :NERDCommenterToggle<CR>
nnoremap <leader>f :CocAction<CR>
nnoremap <leader>g :GFiles<CR>
nnoremap <leader>j <Plug>(jsdoc)
nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <leader>p :Files<CR>
nnoremap <leader>t :TestNearest<CR>

set noshowmode
set number relativenumber
set signcolumn=yes
set termguicolors
set textwidth=100
set updatetime=300

" Use tab for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

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

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')
