syntax on
set nu

call plug#begin('~/.local/share/nvim/plugged')

Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'}
Plug 'sbdchd/neoformat'
Plug 'ensime/ensime-vim', { 'do': ':UpdateRemotePlugins' } 

call plug#end()

set runtimepath+=~/.vim,~/.vim/after
set packpath+=~/.vim
source ~/.vimrc
let g:python_host_prog = '/usr/bin/python2'
let g:python3_host_prog = '/usr/bin/python3'
set clipboard=unnamed
autocmd VimEnter * NERDTree
let g:deoplete#enable_at_startup = 1
if !exists('g:deoplete#omni#input_patterns')
  let g:deoplete#omni#input_patterns = {}
endif
let g:deoplete#omni#input_patterns.scala='[^. *\t]\.\w*'
let g:deoplete#sources._=['buffer', 'member', 'tag', 'file', 'omni', 'ultisnips']
" let g:deoplete#disable_auto_complete = 1
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" deoplete tab-complete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
" tern
autocmd FileType javascript nnoremap <silent> <buffer> gb :TernDef<CR>
noremap <Leader>a :Neoformat<CR>
noremap <c-[> :po<CR>

let g:neoformat_javascript_jsbeautify =  {
            \ 'exe': 'js-beautify',
            \ 'args': ['-b collapse-preserve-inline', '--indent-size 4'],
            \ 'stdin': 1,
            \ }

