set nocompatible

set ai
set expandtab
set hidden
set history=100
set hlsearch
set ignorecase
set incsearch
set mouse=a
set nowrap
set scrolloff=4
set ruler
set shiftwidth=4
set shortmess=atI
set showtabline=2
set sidescroll=8
set softtabstop=4
set smartcase
set smarttab
set tabpagemax=50
set tabstop=4
set wildmenu
set wildmode=list:longest

set backspace=indent,eol,start
set list lcs=tab:\ \ ,extends:>,precedes:<

let c_space_errors=1
match ErrorMsg /\s\+$\| \+\ze\t/

" Display the status line, containing "filename [filetype]   line xx-yy  col yy-zz   xx%"
set laststatus=2
set statusline=%<%f\ %y%m%r\ %=%-16.(line\ %l-%L%)\ %-10.(col\ %c%V%)\ \ %P

" Tab manipulation shortcuts
map <C-t> <Esc>:tabnew 
map <C-n> <Esc>:close<CR>
map l <Esc>:tabn<CR>
map r <Esc>:tabp<CR>
ab tabnew tabnew

filetype on
filetype plugin on
filetype indent on
syntax on
