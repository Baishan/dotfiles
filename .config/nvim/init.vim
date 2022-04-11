source ~/.vimrc
set clipboard=unnamedplus

call plug#begin()
Plug 'dense-analysis/ale'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'amiralies/coc-elixir', {'do': 'yarn install && yarn prepack'}
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'MattesGroeger/vim-bookmarks'

let g:ale_fixers = { 
\   'elixir' : ['mix_format', 'remove_trailing_lines', 'trim_whitespace'],
\   '*': ['remove_trailing_lines', 'trim_whitespace']
\   }

nmap ,f :ALEFix<CR>
call plug#end()

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <leader> rn <Plug>(coc-renamb)
nnoremap <silent> K :call <SID>show_documentation()<CR>
nnoremap <silent> <leader>co  :<C-u>CocList outline<CR>
nnoremap <silent> <leader>cc  :<C-u>CocList commands<CR>
nnoremap <silent> <leader>cs  :<C-u>CocList -I symbols<CR>
nnoremap <silent> <leader>cn  :<C-u>CocNext<CR>
nnoremap <silent> <leader>cp  :<C-u>CocPrev<CR>


function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

:highlight CocFloating ctermbg=black
:highlight CocFloating ctermfg=LightGrey

map <C-p> :Files<CR>
nnoremap <silent> <Leader>f :Rg<CR>
nnoremap <silent> <C-f> :BLines<CR>
nnoremap <silent> <Leader>hh :History<CR>
nnoremap <silent> <Leader>h: :History:<CR>
nnoremap <silent> <Leader>h/ :History/<CR>

nmap MM <Plug>BookmarkToggle
nmap MI <Plug>BookmarkAnnotate
nmap MA <Plug>BookmarkShowAll
nmap MJ <Plug>BookmarkNext
nmap MK <Plug>BookmarkPrev
nmap MC <Plug>BookmarkClear
nmap MX <Plug>BookmarkClearAll
nmap MKK <Plug>BookmarkMoveUp
nmap MJJ <Plug>BookmarkMoveDown
nmap MG <Plug>BookmarkMoveToLine
