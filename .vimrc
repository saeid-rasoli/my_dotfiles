call plug#begin('~/.vim/plugged')
Plug 'mbbill/undotree'
Plug 'ntpeters/vim-better-whitespace'
call plug#end()

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

" run python
map <F8> :w \| term python %<CR>

" no highlight
map <C-n> :noh<CR>

" for opening my file explorer
map <F10> :!thunar $(dirname %) &<CR>

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
set hlsearch
set incsearch
set ts=4 sw=4 st=4
set shiftwidth=4
set smarttab
set expandtab
set ai
set smartindent
set noswapfile
set nobackup
set scrolloff=8
set fileformat=unix
set backspace=indent,eol,start
set splitbelow
set splitright
set timeoutlen=1000 ttimeoutlen=0
set updatetime=2000
set ruler

hi Visual ctermfg=black ctermbg=white
hi NonText ctermbg=black
hi Search ctermfg=black ctermbg=white
hi Normal ctermbg=black
hi Comment ctermfg=green
hi String ctermfg=216
hi Pmenu ctermfg=lightgrey ctermbg=black
hi PmenuSel ctermfg=white ctermbg=black cterm=bold,reverse
hi Cursor ctermbg=NONE ctermfg=NONE cterm=reverse
