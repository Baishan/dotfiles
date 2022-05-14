" vim-sublime - A minimal Sublime Text - like vim experience bundle
"               http://github.com/grigio/vim-sublime
" Best view with a 256 color terminal and Powerline fonts
" Updated by Dorian Neto (https://github.com/dorianneto)"

set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

" ------Plugins-------
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-surround'
"Plugin 'tpope/vim-abolish'
Plugin 'tomtom/tcomment_vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'airblade/vim-gitgutter'
Plugin 'elixir-lang/vim-elixir'
" Plugin 'dunckr/vim-monokai-soda'
Plugin 'crusoexia/vim-monokai'
Plugin 'haya14busa/incsearch.vim'
" Plugin 'easymotion/vim-easymotion'
" Plugin 'haya14busa/incsearch-easymotion.vim'
Plugin 'christoomey/vim-tmux-navigator'

" Color Themes
Plugin 'colors'

call vundle#end()
colorscheme monokai
filetype plugin indent on

""""""""
if has('autocmd')
    filetype plugin indent on
endif
if has('syntax') && !exists('g:syntax_on')
    syntax enable
endif

" Use :help 'option' to see the documentation for the given option.
set autoindent
set backspace=indent,eol,start
set complete-=i
set showmatch
set showmode
set smarttab

set nrformats-=octal
set shiftround

set ttimeout
set ttimeoutlen=50

set incsearch
" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
    nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
endif

set laststatus=2
set ruler
set showcmd
set wildmenu

set autoread

set encoding=utf-8
set tabstop=4 shiftwidth=4 expandtab
set listchars=space:.
set nolist
    

inoremap <C-U> <C-G>u<C-U>

set number

set hlsearch
set ignorecase
set smartcase

" Don't use Ex mode, use Q for formatting
map Q gq

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
    set mouse=a
endif

" do not history when leavy buffer
set hidden

" FIXME: (broken) ctrl s to save
noremap  <C-S> :update<CR>
vnoremap <C-S> <C-C>:update<CR>
inoremap <C-S> <Esc>:update<CR>

set nobackup
set nowritebackup
set noswapfile
set fileformats=unix,dos,mac

" exit insert mode
inoremap <C-c> <Esc>

set completeopt=menuone,longest,preview

"
" Plugins config
"

" CtrlP
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*


" vim-airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

"
" Basic shortcuts definitions
"  most in visual mode / selection (v or ⇧ v)
"

" comment / decomment & normal comment behavior
vmap <C-m> gc
" Disable tComment to escape some entities
let g:tcomment#replacements_xml={}
" Text wrap simpler, then type the open tag or ',"
"
" Tabs
let g:airline_theme='badwolf'
let g:airline#extensions#tabline#enabled = 1
" nnoremap <C-b>  :tabprevious<CR>
" inoremap <C-b>  <Esc>:tabprevious<CR>i
" nnoremap <C-n>  :tabnext<CR>
" inoremap <C-n>  <Esc>:tabnext<CR>i
" nnoremap <C-t>  :tabnew<CR>
" inoremap <C-t>  <Esc>:tabnew<CR>i
" nnoremap <C-q>  :tabclose<CR>
" inoremap <C-q>  <Esc>:tabclose<CR>i

" lazy ':'
map \ :

let mapleader = '\'
nnoremap <Leader>p :set paste<CR>
nnoremap <Leader>o :set nopaste<CR>
noremap  <Leader>g :GitGutterToggle<CR>

"
" if executable('rg')
"     let g:ackprg = 'rg --vimgrep --no-heading'
" elseif executable('ag')
"     let g:ackprg = 'ag --mmap --vimgrep'
" endif
" <Leader>f{char} to move to {char}
" map  <Leader>f <Plug>(easymotion-bd-f)
" nmap <Leader>f <Plug>(easymotion-overwin-f)
"
" " s{char}{char} to move to {char}{char}
" nmap s <Plug>(easymotion-overwin-f2)
"
" " Move to line
" map <Leader>L <Plug>(easymotion-bd-jk)
" nmap <Leader>L <Plug>(easymotion-overwin-line)
"
" " Move to word
" map  <Leader>w <Plug>(easymotion-bd-w)
" nmap <Leader>w <Plug>(easymotion-overwin-w)
"
" map <Leader>l <Plug>(easymotion-lineforward)
" map <Leader>j <Plug>(easymotion-j)
" map <Leader>k <Plug>(easymotion-k)
" map <Leader>h <Plug>(easymotion-linebackward)
" map <TAB> <Plug>(easymotion-s)

"incsearch
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)


"incsearch easymotion
" map / <Plug>(incsearch-easymotion-/)
" map ? <Plug>(incsearch-easymotion-?)
" map g/ <Plug>(incsearch-easymotion-stay)

set relativenumber
let g:ale_javascript_eslint_options = "--rule 'indent: [\"error\", 4]'"
"
