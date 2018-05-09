autocmd!
set nocompatible
set noshowmode

filetype off
filetype plugin indent off

call plug#begin()

Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'junegunn/seoul256.vim'

Plug 'tpope/vim-sensible'

Plug 'Xuyuanp/nerdtree-git-plugin' 

Plug 'scrooloose/nerdtree'

Plug 'tpope/vim-commentary'

Plug 'itchyny/lightline.vim'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'python-mode/python-mode', {'branch': 'develop'}

Plug 'sheerun/vim-polyglot'

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
map <Space> :NERDTreeToggle<CR>

map <C-X> :qa!<CR>

set nowrap

color seoul256 

set mouse=a
set numberwidth=1
set number relativenumber

set fileformats=unix,mac,dos

call deoplete#enable()

set noswapfile

command! -nargs=* W write <args>
let g:pymode_lint = 1
let g:pymode_lint_unmodified = 0
let g:pymode_link_on_fly = 0

set nofoldenable
