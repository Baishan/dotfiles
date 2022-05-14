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
Plug 'tpope/vim-repeat'
Plug 'svermeulen/vim-yoink'
Plug 'svermeulen/vim-cutlass'
Plug 'svermeulen/vim-subversive'
Plug 'ggandor/leap.nvim'

let g:ale_fixers = { 
\   'elixir' : ['mix_format', 'remove_trailing_lines', 'trim_whitespace'],
\   '*': ['remove_trailing_lines', 'trim_whitespace']
\   }

call plug#end()

nmap ,f :ALEFix<CR>

nnoremap m d
xnoremap m d

nnoremap mm dd
nnoremap M D

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <leader> rn <Plug>(coc-rename)
nnoremap <silent> K :call <SID>show_documentation()<CR>
nnoremap <silent> <leader>co  :<C-u>CocList outline<CR>
nnoremap <silent> <leader>cc  :<C-u>CocList commands<CR>
nnoremap <silent> <leader>cs  :<C-u>CocList -I symbols<CR>
nnoremap <silent> <leader>cn  :<C-u>CocNext<CR>
nnoremap <silent> <leader>cp  :<C-u>CocPrev<CR>

nmap <c-[> <plug>(YoinkPostPasteSwapBack)
nmap <c-]> <plug>(YoinkPostPasteSwapForward)
nmap p <plug>(YoinkPaste_p)
nmap P <plug>(YoinkPaste_P)

nmap s <plug>(SubversiveSubstitute)
nmap ss <plug>(SubversiveSubstituteLine)
nmap S <plug>(SubversiveSubstituteToEndOfLine)

nmap <leader>s <plug>(SubversiveSubstituteRange)
xmap <leader>s <plug>(SubversiveSubstituteRange)
nmap <leader>ss <plug>(SubversiveSubstituteWordRange)
nmap <leader>cs <plug>(SubversiveSubstituteRangeConfirm)
xmap <leader>cs <plug>(SubversiveSubstituteRangeConfirm)
nmap <leader>css <plug>(SubversiveSubstituteWordRangeConfirm)
" Also replace the default gp with yoink paste so we can toggle paste in this case too
nmap gp <plug>(YoinkPaste_gp)
nmap gP <plug>(YoinkPaste_gP)

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
nnoremap <silent> <Leader>F :Rg <C-R><C-W><CR>
nnoremap <silent> <C-f> :BLines<CR>
nnoremap <silent> <Leader>hh :History<CR>
nnoremap <silent> <Leader>h: :History:<CR>
nnoremap <silent> <Leader>h/ :History/<CR>
nnoremap <silent> <Leader>b :Buffers<CR>
nnoremap <silent> <Leader>t :Windows<CR>

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

nnoremap <S-n> :CocCommand explorer<CR>
let g:yoinkIncludeDeleteOperations = 1
nmap <space> <Plug>(leap-forward)
nmap <C-Space> <Plug>(leap-backward)
