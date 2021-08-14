call plug#begin('~/.vim/plugged')
Plug 'mbbill/undotree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'bling/vim-bufferline'
Plug 'ntpeters/vim-better-whitespace'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'fannheyward/coc-pyright'
Plug 'honza/vim-snippets'
call plug#end()

" disable preview autocomplete showup
let b:coc_suggest_disable = 1
" autocomplete popup (coc)
inoremap <silent><expr> <c-n> coc#refresh()
" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)
" Symbol renaming.
nmap <leader>rs <Plug>(coc-rename)
" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')
" Use c-k to show documentation in preview window.
nnoremap <silent> <c-k> :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction
" Mappings for CoCList
" Rename file
nnoremap <silent><nowait> <leader>rf  :<C-u>CocCommand workspace.renameCurrentFile<cr>
" Sort python import modules
nnoremap <silent><nowait> <space>c  :<C-u>CocCommand python.sortImports<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocDiagnostics<CR>
" scroll through document
nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"

" coc-snippets
" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" highlight whitespaces
let g:better_whitespace_enabled=1

" undotree
nnoremap <F5> :UndotreeToggle<cr>

au BufReadPost * call ReadUndo()
au BufWritePost * call WriteUndo()
func ReadUndo()
	if filereadable('/tmp/daily/UNDO/' . expand('%:t'))
		rundo /tmp/daily/UNDO/%:t
	endif
endfunc
func WriteUndo()
	let dirname = '/tmp/daily/UNDO'
	if !isdirectory(dirname)
		call mkdir(dirname)
	endif
	wundo /tmp/daily/UNDO/%:t
endfunc

" fzf
let g:fzf_preview_window = 'right:60%'
nnoremap <C-p> :FZF --preview=head\ -50\ {}<Cr>

" pylint
map <F6> :!pylint %<CR>

" run python
map <F8> :w \| term python %<CR>

" for opening my file explorer
map <F9> :!thunar $(dirname %) &<CR>

" next and previous buffers
map <C-PageUp> :bp<CR>
map <C-PageDown> :bn<CR>

" no highlight
map <C-n> :noh<CR>

" cursor custom style
if &term =~? "xterm" || &term =~? "rxvt"
	let &t_SI = "\<Esc>[6 q"
	let &t_EI = "\<Esc>[1 q"
	autocmd VimLeave * let &t_me = "\<Esc>[1 q"
endif

" delete buffer
map <c-c><c-c> :bd!<CR>

" copy to clipboard
nnoremap <C-S-c> "+y
vnoremap <C-S-c> "+y

" setters
set number
set hidden
set hlsearch
set incsearch
set ts=4 sw=4 st=4
set shiftwidth=4
set smarttab
set expandtab
set autoindent
set smartindent
set noswapfile
set nobackup
set laststatus=2
set statusline=%F%m%r%h%w%=\ %Y\ [%04l,%04v]\ %p%%\ %L
set scrolloff=8
set fileformat=unix
set backspace=indent,eol,start
set splitbelow
set splitright
set timeoutlen=1000 ttimeoutlen=0
set updatetime=2000
set cursorline

" custom colors
set termguicolors
set background=dark

hi Visual guifg=black guibg=white
hi Pmenu guifg=lightgrey guibg=black
hi PmenuSel guifg=white guibg=black cterm=bold,reverse
hi Normal guibg=black guifg=white
hi NonText guibg=black
hi Search guifg=black guibg=white
hi cOperator guifg=#ffdd00
hi Cursor guibg=NONE guifg=NONE gui=reverse
hi CocErrorHighlight guibg=#770000 guifg=#ffffff
hi CocUnusedHighlight cterm=underline gui=underline
hi CocFloating guifg=#ffffff
hi CocFloating guibg=#222222
hi clear CursorLine
hi CursorLineNR cterm=bold

" gui stuffs
set guioptions-=m
set guioptions-=T
set guioptions+=a
set laststatus=0
set guifont=Liberation\ Mono\ Regular\ 11
