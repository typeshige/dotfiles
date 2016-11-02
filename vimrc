" Use Vim settings not Vi, must be first
set nocompatible

filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" Appearance.vundles

Plugin 'skwp/vim-colors-solarized'
Plugin 'itchyny/lightline.vim'
Plugin 'myusuf3/numbers.vim'

" Git.vundles

Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-git'

" Languages.vundles

Plugin 'scrooloose/syntastic'
Plugin 'ivanov/vim-ipython'

" Project.vundles

Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'scrooloose/nerdtree'

" Vim-improvement.vundles

Plugin 'AndrewRadev/splitjoin.vim'
Plugin 'Raimondi/delimitMate'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'sjbach/lusty'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'haya14busa/incsearch.vim'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'tpope/vim-commentary'
Plugin 'python-rope/ropevim'
Plugin 'sukima/xmledit'

call vundle#end()

filetype on
filetype plugin on
filetype indent on

" General
set number                          " show line number
set backspace=indent,eol,start      " Allow backspacing over everything in insert mode
set history=1000                    " Lots of :cmdline history
set showmatch
set matchtime=0
set shortmess=atI
set showcmd                         " Show incomplete cmds down the bottom
set noshowmode                      " Don't show current mode down the bottom
set visualbell                      " No sounds
set autoread
set hidden
syntax on 

let mapleader = ','

" Search Settings
set hlsearch
set incsearch
set ignorecase
set smartcase " if caps, go case-sensitive

" Turn Off Swap Files
set noswapfile
set nobackup
set nowritebackup

" Indentation
set autoindent
set smartindent
set smarttab
set shiftwidth=4 
set softtabstop=4 
set tabstop=8
set expandtab


" Display Tab and Trailing Spaces
"set listchars=tab:▷⋅,trail:⋅,nbsp:
set listchars=tab:>-,trail:- " show tabs and trailing
"set listchars=tab:▸\ ,trail:·,eol:¬
"set listchars=tab:▸\ ,trail:·

set nowrap
set linebreak

" Folds
set foldmethod=indent
set foldlevel=99
set nofoldenable  "don't fold by default
set matchpairs+=<:>


" Completion
set wildmode=list:longest
set wildmenu
set wildignore+=.git,*.pyc
set wildignore+=*.png,*.jpg,*.gif

set formatoptions=rq " insert comment leader on return, let gq format
set infercase " case inferred
set shiftround
set textwidth=80

set encoding=utf-8
scriptencoding utf-8

set history=1000
set spell

set fileformats=unix,mac,dos

imap jj <Esc>
set noexrc " don't use local version of .(g)vimrc, etc
set numberwidth=1
nnoremap <F2> :set nonumber!<CR>:set foldcolumn=0<CR>

" Vertical and horizontal split then hop to a new buffer
:noremap <Leader>v :vsp^M^W^W<cr>
:noremap <Leader>h :split^M^W^W<cr>

set autochdir

set ai

set mouse=a " use mouse everywhere

"Vim UI
set cursorcolumn " highlight the current column
set cursorline " highlight the current line
set nostartofline
set list " show tabs

set ruler
set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%)
set scrolloff=5 " keep 10 lines top/bottom for scope
set sidescrolloff=7
set sidescroll=1
set laststatus=2

"Python
autocmd BufRead,BufNewFile *.py syntax on
autocmd BufRead,BufNewFile *.py set ai
autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,with,try,except,finally,def,class

set title

set guioptions-=T

:noremap <Leader>1 :set number!<CR>
:noremap <Leader>V :edit $MYVIMRC<CR>
:noremap <Leader>a :NERDTree ~/.virtualenvs<CR>
:noremap <Leader>n :NERDTreeToggle<CR>
:noremap <Leader>p :NERDTree ~/projects<CR>
:noremap <Leader>j :RopeGotoDefinition<CR>

map <Leader>b :LustyJuggler<CR>
let g:pymode_breakpoint_key = '<leader>B'
let g:pymode_folding = 0
"let g:pymode_lint_ignore = "E501"
let g:pymode_rope_goto_def_newwin = "new"
map <Leader>H :set hls!<CR>

" Text bubbling

:noremap <C-k> [e
:noremap <C-j> ]e
vmap <C-k> [egv
vmap <C-j> ]egv

" Visually select the text that was last edited/pasted
nmap gV `[v`]

command! -nargs=* W write <args>

" PYDICTION
"
let g:pydiction_location='~/vimfiles/vim/bundle/pydiction/complete-dict'
let g:pydiction_menu_height = 20

" COLORS
"
set t_Co=256
set background=dark
let g:solarized_termtrans = 1
colorscheme solarized

" Insert New Line *************************************************************
map <S-Enter> O<ESC> " awesome, inserts new line without going into insert mode
map <Enter> o<ESC>

autocmd FileType python set complete+=k~/.vim/syntax/python.vim isk+=.,(
autocmd FileType python set ft=python.django
autocmd FileType html set ft=htmldjango.html

autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p
"autocmd FileType python compiler pylint

autocmd bufwritepost .vimrc source $MYVIMRC

"the quickfix window is not always 10 lines height
au FileType qf call AdjustWindowHeight(3, 10)
function! AdjustWindowHeight(minheight, maxheight)
    exe max([min([line("$"), a:maxheight]), a:minheight]) . "wincmd _"
endfunction


"quickfix toogle
command! -bang -nargs=? QFix call QFixToggle(<bang>0)
function! QFixToggle(forced)
  if exists("g:qfix_win") && a:forced == 0
    cclose
    let g:pylint_cwindow = 0
    unlet g:qfix_win
  else
    copen 10
    call AdjustWindowHeight(3, 10)
    let g:pylint_cwindow = 1
    let g:qfix_win = bufnr("$")
  endif
endfunction

function TrimEndLines()
    let save_cursor = getpos(".")
    :silent! %s#\($\n\s*\)\+\%$##
    call setpos('.', save_cursor)
endfunction


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Trim trailing whitespace
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType python autocmd BufWritePre <buffer> :call TrimEndLines() | call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))
autocmd FileType html autocmd BufWritePre <buffer> :call TrimEndLines() | call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"highlight columns over 79
"from http://vim.wikia.com/wiki/Highlight_long_lines
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if exists("+colorcolumn")
    set colorcolumn=79
else
    au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>79v.\+', -1)
endif


" GUI Settings {
if has("gui_running")
    " Basics {
        colorscheme shige-wombat256
        set columns=180
        set guifont=Inconsolata\ Medium\ 12
        set guioptions=ce
    " }
endif
" }
"

set grepprg=ack-grep

set completeopt=menuone,longest,preview
set pumheight=6

let NERDTreeIgnore = ['\.pyc$']
let NERDTreeMouseMode = 3

autocmd FileType python map <buffer> <leader>8 :call Pep8()<CR>
autocmd FileType python map <buffer> <leader>f :call Pyflakes()<CR>


"autocmd FileType html,xhtml,xml,htmldjango,htmljinja,eruby,mako setlocal noexpandtab shiftwidth=2 tabstop=2 softtabstop=2
"

au FileType python set omnifunc=pythoncomplete#Complete
au BufRead *.py set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m

"let g:pyflakes_use_quickfix = 0

" Add the virtualenv's site-packages to vim path
py << EOF
import os.path
import sys
import vim
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    sys.path.insert(0, project_base_dir)
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF

map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

let g:lightline = {}
let g:lightline.component = {
    \ 'lineinfo': '%-2v' }

map <Space> <PageDown>

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
