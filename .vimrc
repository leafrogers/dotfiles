call plug#begin()
Plug 'airblade/vim-gitgutter'
Plug 'chriskempson/base16-vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'honza/vim-snippets'
Plug 'itchyny/lightline.vim'
Plug 'itchyny/vim-gitbranch'
Plug 'janko/vim-test'
Plug 'joegesualdo/jsdoc.vim'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'preservim/nerdcommenter'
Plug 'preservim/nerdtree'
Plug 'tpope/vim-sensible'
call plug#end()

colorscheme base16-gruvbox-dark-medium

let g:coc_snippet_next = '<tab>'
let g:lightline = {
\	'active': {
\		'left': [ [ 'mode', 'paste' ], [ 'gitbranch' ], [ 'readonly', 'filename', 'modified' ] ],
\		'right': [ [ 'lineinfo' ], [ 'percent' ], [ 'linting'] ]
\	},
\	'component_function': {
\		'gitbranch': 'gitbranch#name',
\		'linting': 'StatusDiagnostic'
\	},
\	'subseparator': { 'left': '│' }
\ }

let mapleader=','
let NERDSpaceDelims=1
let NERDTreeQuitOnOpen=1

map <leader>a :<C-u>CocList diagnostics<CR>
map <leader>c<space> :NERDCommenterToggle<CR>
map <leader>f :CocAction<CR>
map <leader>n :NERDTreeToggle<CR>
map <leader>p :CtrlPMixed<CR>
map <leader>t :TestNearest<CR>

set noshowmode
set number relativenumber
set signcolumn=yes
set termguicolors
set updatetime=300
set wildignore+=*/node_modules/*

function! StatusDiagnostic() abort
	let data = get(b:, 'coc_diagnostic_info', {})
	let msgs = []
	if empty(data) || eval(join(data['lnums'], '+')) == 0
		return 'Linted ✔'
	endif
	if get(data, 'information', 0)
		call add(msgs, 'ℹ️  Messages: ' . data['information'])
	endif
	if get(data, 'warning', 0)
		call add(msgs, '⚠️  Warnings: ' . data['warning'])
	endif
	if get(data, 'error', 0)
		call add(msgs, '🚫 Errors: ' . data['error'])
	endif
	return join(msgs, ' │ ')
endfunction
