call plug#begin('~/.vim/plugged')
Plug 'Vimjas/vim-python-pep8-indent'
call plug#end()

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

" setters
set hlsearch
set incsearch
set ts=4 sw=4 st=4
set shiftwidth=4
set smarttab
set expandtab
set ai
set smartindent
set scrolloff=8
set fileformat=unix
set backspace=indent,eol,start
set splitbelow
set splitright
set timeoutlen=1000 ttimeoutlen=0
set updatetime=2000
set ruler
set relativenumber
set cursorline
set undofile
set undodir=/tmp/daily/UNDO/
set backupdir=/tmp/daily/UNDO/
set directory=/tmp/daily/UNDO/

" custom status line
function! InsertStatuslineColor(mode)
  if a:mode == 'i'
    hi statusline ctermfg=black ctermbg=white
  elseif a:mode == 'r'
    hi statusline ctermfg=black ctermbg=white
  endif
endfunction
au InsertEnter * call InsertStatuslineColor(v:insertmode)
au InsertLeave * hi statusline ctermfg=white ctermbg=0
" default the statusline to green when entering Vim
hi statusline ctermfg=white ctermbg=0

" Formats the statusline
set laststatus=2
set statusline=%1*%f                                 " file name
set statusline+=%*                                   " reset color
set statusline+=\ [%{strlen(&fenc)?&fenc:'none'},    " file encoding
set statusline+=%{&ff}]                              " file format
set statusline+=\ %Y                                 " filetype
set statusline+=%h                                   " help file flag
set statusline+=%m                                   " modified flag
set statusline+=%r                                   " read only flag
set statusline+=\ %=                                 " align left
set statusline+=Line:%l/%L[%p%%]                     " line X of Y [percent of file]
set statusline+=\ Col:%c                             " current column

hi User1 ctermbg=green ctermfg=black cterm=bold

hi Visual ctermfg=black ctermbg=white
hi NonText ctermbg=black
hi Search ctermfg=black ctermbg=white
hi Normal ctermbg=black
hi Comment ctermfg=green
hi String ctermfg=216
hi Pmenu ctermfg=lightgrey ctermbg=black
hi PmenuSel ctermfg=white ctermbg=black cterm=bold,reverse
hi CursorLine cterm=none ctermfg=none ctermbg=none
hi CursorLineNr cterm=bold
