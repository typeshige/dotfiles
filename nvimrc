set nocompatible
set autoread
filetype off

call plug#begin()

Plug 'VundleVim/Vundle.vim'

" Appearance.vundles

Plug 'skwp/vim-colors-solarized'
Plug 'itchyny/lightline.vim'
Plug 'myusuf3/numbers.vim'
Plug 'freeo/vim-kalisi'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'leshill/vim-json'
Plug 'ajh17/Spacegray.vim'
Plug 'ryanoasis/vim-devicons'



" Git.vundles

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git'
Plug 'tpope/vim-surround'
Plug 'gregsexton/gitv'


" Languages.vundles

Plug 'w0rp/ale'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'sbdchd/neoformat'


" Project.vundles

Plug 'jistr/vim-nerdtree-tabs'
Plug 'scrooloose/nerdtree'
Plug 'majutsushi/tagbar'
Plug 'ervandew/supertab'
Plug 'Shougo/neocomplete.vim'


" Vim-improvement.vundles

Plug 'AndrewRadev/splitjoin.vim'
Plug 'Raimondi/delimitMate'
Plug 'jlanzarotta/bufexplorer'
Plug 'Lokaltog/vim-easymotion'
Plug 'haya14busa/incsearch.vim'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'tpope/vim-commentary'
Plug 'ntpeters/vim-better-whitespace'
Plug 'davidhalter/jedi-vim'
Plug 'vim-scripts/closetag.vim'
Plug 'google/yapf'
Plug 'Shougo/deoplete.nvim'
Plug 'python-mode/python-mode', {'branch': 'develop'}
Plug 'editorconfig/editorconfig-vim'


call plug#end()

filetype plugin indent on

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
let maplocalleader = "\\"

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
" autocmd InsertEnter * highlight CursorColumn ctermfg=White ctermbg=Yellow cterm=bold guifg=white guibg=yellow gui=bold
" autocmd InsertLeave * highlight CursorColumn ctermfg=Black ctermbg=Yellow cterm=bold guifg=Black guibg=yellow gui=NONE
set cursorline " highlight the current line
" autocmd InsertEnter * highlight CursorLine guibg=#000050 guifg=fg
" autocmd InsertLeave * highlight CursorLine guibg=#004000 guifg=fg

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
" let g:pymode_breakpoint_key = '<leader>B'
" let g:pymode_folding = 0
"let g:pymode_lint_ignore = "E501"
" let g:pymode_rope_goto_def_newwin = "new"

let pymode = 1
let pymode_breakpoint = 1
let pymode_breakpoint_bind = '<leader>b'
let pymode_doc = 1
let pymode_doc_bind = 'K'
let pymode_folding = 1
let pymode_indent = 1
let pymode_lint = 1
let pymode_lint_checkers = ['pyflakes', 'pep8', 'mccabe']
let pymode_lint_cwindow = 1
let pymode_lint_ignore = ''
let pymode_lint_message = 1
let pymode_lint_on_fly = 0
let pymode_lint_on_write = 1
let pymode_lint_select = ''
let pymode_lint_signs = 1
let pymode_motion = 1
let pymode_options = 1
let pymode_paths = []
let pymode_quickfix_maxheight = 6
let pymode_quickfix_minheight = 3
let pymode_rope = 0
let pymode_run = 1
let pymode_run_bind = '<leader>r'
let pymode_trim_whitespaces = 1
let pymode_virtualenv = 1
let pymode_virtualenv_enabled = ''
let pymode_virtualenv_path = ''







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
let &t_AB="\e[48;5;%dm"
let &t_AF="\e[38;5;%dm"

if &term =~ '256color'
    " disable background color erase
    set t_ut=
endif

" enable 24 bit color support if supported
if (has('mac') && empty($TMUX) && has("termguicolors"))
    set termguicolors
endif

let base16colorspace=256

" let g:solarized_termtrans = 1
colorscheme spacegray 
let g:spacegray_underline_search = 1
let g:spacegray_italicize_comments = 1

set background=dark

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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Trim trailing whitespace
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"highlight columns over 79
"from http://vim.wikia.com/wiki/Highlight_long_lines
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if exists("+colorcolumn")
    set colorcolumn=79
else
    au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>79v.\+', -1)
endif


set grepprg=ack-grep

set completeopt=menuone,longest,preview
set pumheight=6

let NERDTreeIgnore = ['\.pyc$']
let NERDTreeMouseMode = 3

autocmd FileType python map <buffer> <leader>8 :call Pep8()<CR>
autocmd FileType python map <buffer> <leader>f :call Pyflakes()<CR>
autocmd FileType python nnoremap <LocalLeader>= :0,$!yapf<CR>


"autocmd FileType html,xhtml,xml,htmldjango,htmljinja,eruby,mako setlocal noexpandtab shiftwidth=2 tabstop=2 softtabstop=2
"

au FileType python set omnifunc=pythoncomplete#Complete
au BufRead *.py set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m

map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

let g:lightline = {}
let g:lightline.component = {
    \ 'lineinfo': '%-2v' }

map <Space> <PageDown>

set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:deoplete#enable_at_startup = 1
let g:ale_sign_column_always = 1
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'

let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 0

autocmd FileType nerdtree setlocal nocursorcolumn

let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='hybrid'
let g:airline_powerline_fonts = 1
let g:hybrid_custom_term_colors = 1
let g:hybrid_reduced_contrast = 1 

" Syntastic Configuration
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

autocmd FileType python nnoremap <LocalLeader>= :0,$!yapf<CR>

let g:python2_host_prog = '/Users/sabe/.virtualenvs/neovim2/bin/python'
let g:python3_host_prog = '/Users/sabe/.virtualenvs/neovim3/bin/python'

let g:javascript_plugin_flow = 1

let g:jsx_ext_required = 0

