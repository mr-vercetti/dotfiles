" Automatically reloads .vimrc file
autocmd! bufwritepost .vimrc source %

" Colorscheme
colorscheme slate

" KEY BINDING
" Better copy/paste (for big text blocks)
set pastetoggle=<F2>
set clipboard=unnamed
"Bind <Leader> to ,
let mapleader = ","

" Automatic closing brackets
" If you want to escape it, just click CTRL+v before
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

" Split navigations, CTRL+h/j/k/l to move around windows
" CTRL+j to move down
nnoremap <C-J> <C-W><C-J>
" CTRL+k to move up
nnoremap <C-K> <C-W><C-K>
" CTRL+l to move right
nnoremap <C-L> <C-W><C-L>
" CTRL+h to move left
nnoremap <C-H> <C-W><C-H>

" Click CTRL+n to remove highlight
noremap <C-n> :nohl<CR>
vnoremap <C-n> :nohl<CR>
inoremap <C-n> :nohl<CR>

" Better moving blocks of code, select and click > or < to move
vnoremap < <gv
vnoremap > >gv

" VISUAL FEATURES
" File recognition and sytnax highlighting
filetype plugin indent on
syntax on

" Displays the line number
" set number

" Displays dynamic line numbers (relative except current line)
set nu rnu

" Disables text wrapping, if needed select text and click gq
set tw=79
set nowrap
set fo-=t

" Displays column
" set colorcolumn=80
" highlight ColorColumn ctermbg=233

" Fuck tabs, only spaces
set tabstop=3
set softtabstop=3
set shiftwidth=3
set shiftround
set expandtab

" Searching settings - highlight founded phrase, distinguish case
set hlsearch
set incsearch
set ignorecase
set smartcase

" Fuck .swp and backup files
set nobackup
set nowritebackup
set noswapfile
