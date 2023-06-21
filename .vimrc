set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'altercation/vim-colors-solarized'
Plugin 'ctrlpvim/ctrlp.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" NERDTREE
let NERDTreeShowHidden=1
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeNodeDelimiter = "\u00a0" " Temporary fix for Nerdtree show ^G

" SOLARIZED
"syntax enable
"set background=dark
"silent! colorscheme solarized


"-----------------------------------VISUAL--------------------------------------
syntax on           " Enable syntax highlighting.
set number relativenumber " Enable hybrid lines.

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

set nowrap       "Don't wrap lines
set linebreak    "Wrap lines at convenient points

" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·

:set colorcolumn=80 " Show column marker.


"-----------------------------------SEARCH--------------------------------------
set incsearch       " Find the next match as we type the search
set hlsearch        " Highlight searches by default
set ignorecase      " Ignore case when searching...
set smartcase       " ...unless we type a capital


"-----------------------------------INDENTIONS----------------------------------
set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

filetype plugin on
filetype indent on


"-----------------------------------OTHERS-------------------------------------
set backupdir=~/.vim/backup
set directory=~/.vim/swap
