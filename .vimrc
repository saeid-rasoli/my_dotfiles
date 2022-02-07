" relative number toggle (for copy paste)
map <F6> :set relativenumber! \| set number!<CR>

" run python
map <F8> :w \| term python3 %<CR>

" for opening my file explorer
map <F10> :!thunar $(dirname %) &<CR>

" no highlight
map <C-n> :noh<CR>

" cursor custom style
let &t_SI = "\<Esc>[6 q"
let &t_EI = "\<Esc>[1 q"
autocmd VimLeave * let &t_me = "\<Esc>[1 q"

" delete buffer
map <c-c><c-c> :bd!<CR>

" setters
syntax on
set relativenumber number
set hlsearch incsearch
set shiftwidth=4 softtabstop=4 shiftwidth=4
set expandtab smarttab autoindent
set scrolloff=8
set fileformat=unix
set backspace=indent,eol,start
set splitbelow splitright
set timeoutlen=1000 ttimeoutlen=0 updatetime=2000
set undofile undodir=/tmp/UNDO/ backupdir=/tmp/UNDO/ directory=/tmp/UNDO/

" statusline color per mode
function! InsertStatuslineColor(mode)
  if a:mode == 'i'
    hi statusline ctermfg=black ctermbg=white
  endif
endfunction
au InsertEnter * call InsertStatuslineColor(v:insertmode)
au InsertLeave * hi statusline ctermfg=white ctermbg=0
" set file name statusline color constant
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

hi User1 ctermbg=white ctermfg=black cterm=bold
hi Visual ctermfg=black ctermbg=white
hi NonText ctermbg=black
hi Search ctermfg=black ctermbg=white
hi Normal ctermbg=black
hi Comment ctermfg=red
hi String ctermfg=216
hi Pmenu ctermfg=lightgrey ctermbg=black
hi PmenuSel ctermfg=white ctermbg=black cterm=bold,reverse
hi CursorLine cterm=none ctermfg=none ctermbg=none
hi CursorLineNr cterm=bold
hi MatchParen cterm=bold ctermbg=green ctermfg=red
