set nocompatible

set guioptions-=T guifont=Pragmata\ TT\ 8,monospace\ 8
"set background=light
colorscheme xoria256

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
set tabpagemax=20
set tabstop=4
set t_Co=256
set wildmenu
set wildmode=list:longest

set backspace=indent,eol,start
" set tags=tags,../tags,$workspace/tags,~/.vim/tags,/dev/null
set list lcs=tab:\ \ ,extends:>,precedes:<

let c_space_errors=1
match ErrorMsg /\s\+$\| \+\ze\t/

" Display the current branch in Git, or nothing if not in a repo
function MyGitBranch()
	if exists("*GitBranch")
		let a = GitBranch()
		if a != ""
			return "[git] " . a
		endif
	else
		return ""
	endif
endfunction

" Display the status line, containing "filename [filetype]   [git] gitbranch
" line xx-yy  col yy-zz   xx%"
set laststatus=2
set statusline=%<%f\ %y%m%r\ %=%-20.(%{MyGitBranch()}%)\ \ \ \ %-16.(line\ %l-%L%)\ %-10.(col\ %c%V%)\ \ %P

" Quick shortcuts for keymappings
let mapleader = "-"
map <Leader>w :w<CR>
map <Leader>q :wqa<CR>
map <Leader>x :qa!<CR>
map <Leader>s :source ~/.vimrc<CR>
map <Leader>v :set paste<CR>i<C-r>*<Esc>:set nopaste<CR>

" Tab manipulation shortcuts
map <C-t> <Esc>:tabnew 
map <C-n> <Esc>:close<CR>
map l <Esc>:tabn<CR>
map r <Esc>:tabp<CR>
ab tabnew tabnew

" Utility shortcuts
map <F2> <Esc>:make<CR>
" map <S-F2> <Esc>:!ctags-exuberant -R -f tags --totals=yes<CR>
map <F4> 
" map <F5> <Esc>:tag 
map <F9> <Esc>:set list lcs=tab:>\ ,trail:%,eol:$,extends:>,precedes:<<CR>
map <S-F9> <Esc>:set list lcs=tab:\ \ ,extends:>,precedes:<<CR>

map <S-F12> <Esc>:filetype detect<CR>
map <F12> <Esc>:nohlsearch<CR>

" Tab or completion
function TabComplete()
	let col = col('.')-1
	if !col || getline('.')[col-1] !~ '\k'
		return "\<tab>"
	else
		return "\<C-X>\<C-O>"
	endif
endfunction

filetype on
filetype plugin on
filetype indent on
syntax on

augroup files
  au!
  au FileType php set makeprg=php\ -l\ % errorformat=%m\ in\ %f\ on\ line\ %l
  au FileType php inoremap <Tab> <C-R>=TabComplete()<CR>

  au FileType python set makeprg=python\ -c\ \"import\ py_compile,sys;\ sys.stderr=sys.stdout;\ py_compile.compile(r'%')\" efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
  au FileType python inoremap <Tab> <C-R>=TabComplete()<CR>

  au FileType perl set makeprg=perl\ -c\ %
  au FileType perl inoremap <Tab> <C-R>=TabComplete()<CR>
augroup END

" Automatically close the omni-completion window
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

