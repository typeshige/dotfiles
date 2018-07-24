autocmd!
set nocompatible
set noshowmode

filetype off
filetype plugin indent off

call plug#begin()

Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'junegunn/seoul256.vim'
Plug 'lifepillar/vim-wwdc16-theme'

Plug 'tpope/vim-sensible'

Plug 'Xuyuanp/nerdtree-git-plugin' 

Plug 'scrooloose/nerdtree'

Plug 'tpope/vim-commentary'

Plug 'itchyny/lightline.vim'
Plug 'maximbaz/lightline-ale'

Plug 'mattn/emmet-vim'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

Plug 'zchee/deoplete-jedi'

Plug 'sheerun/vim-polyglot'

Plug 'w0rp/ale'

Plug 'google/yapf', { 'rtp': 'plugins/vim', 'for': 'python' }

" Conflicts with ale
" Plug 'airblade/vim-gitgutter'

call plug#end()

filetype plugin indent on
syntax on

map <S-Enter> O<ESC>
map <Enter> o<ESC>

let g:NERDTreeQuitOnOpen = 1
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p
let NERDTreeIgnore = ['\.pyc$']
let g:NERDTreeMouseMode = 3
map \ :NERDTreeToggle<CR>

map <C-X> :qa!<CR>

set nowrap

colorscheme wwdc16

set mouse=a
set numberwidth=1
set number relativenumber

set fileformats=unix,mac,dos

let g:python3_host_prog = '/Users/shigea/.virtualenvs/neovim3/bin/python'

" call deoplete#enable()
let g:deoplete#enable_at_startup = 1
let g:deoplete#auto_completion_start_length = 0

set noswapfile

command! -nargs=* W write <args>

set nofoldenable

autocmd Filetype html setlocal tabstop=2
autocmd Filetype html setlocal shiftwidth=2

set cursorcolumn

map <Space> <PageDown>

let g:ale_open_list = 1

let g:lightline = {}

let g:lightline.component_expand = {
      \  'linter_checking': 'lightline#ale#checking',
      \  'linter_warnings': 'lightline#ale#warnings',
      \  'linter_errors': 'lightline#ale#errors',
      \  'linter_ok': 'lightline#ale#ok',
      \ }

let g:lightline.component_type = {
      \     'linter_checking': 'left',
      \     'linter_warnings': 'warning',
      \     'linter_errors': 'error',
      \     'linter_ok': 'left',
      \ }

" let g:lightline.active = { 'right': [[ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ]] }


let g:ale_fixers = {
     \ 'html': ['eslint', 'trim_whitespace', 'remove_trailing_lines'],
     \ 'python': ['trim_whitespace', 'remove_trailing_lines']
     \ }

let g:ale_fix_on_save = 1


autocmd FileType python set shiftwidth=2
autocmd FileType python set tabstop=2
autocmd FileType python set softtabstop=2

set noshowmode
set laststatus=1
