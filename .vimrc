set nocompatible
filetype off

" Including Vundle
set rtp+=~/.vim/bundle/Vundle.vim

" Installing Vundle plugins
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'godlygeek/tabular'
Plugin 'lervag/vimtex' 
Plugin 'mhinz/vim-startify'
Plugin 'ervandew/supertab'
Plugin 'junegunn/goyo.vim'
Plugin 'junegunn/limelight.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'w0rp/ale'

call vundle#end()

filetype plugin on
syntax on

"Tab Character Settings
set tabstop=2
set sts=2
set sw=2
set et
set shiftwidth=2
set smartindent
set smarttab
set autoindent

"Nerdtree Settings
"map <S-Right> :tabn<CR>
"map <S-Left>  :tabp<CR>
let NERDTreeMinimalUI = 1

"Setting theme for statusline
let g:airline_theme='powerlineish'

"Setting callback for vimtex
let g:vimtex_compiler_latexmk = {'callback' : 0}
let g:vimtex_latexmk_options='-pdf -pdflatex=\"xelatex -synctex=1 %S %O\" -verbose -file-line-error -interaction=nonstopmode'
let g:vimtex_view_method = 'skim'
let g:tex_flavor = 'latex'

"Setting vim-markdown parameters
let g:vim_markdown_new_list_item_indent = 2

" Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240

" Color name (:help gui-colors) or RGB color
let g:limelight_conceal_guifg = 'DarkGray'
let g:limelight_conceal_guifg = '#777777'

" Default: 0.5
let g:limelight_default_coefficient = 0.7

" Number of preceding/following paragraphs to include (default: 0)
let g:limelight_paragraph_span = 1

" Highlighting priority (default: 10)
"   Set it to -1 not to overrule hlsearch
let g:limelight_priority = -1

"Delete Settings
set backspace=2

"no swap file
set noswapfile

"Colors
colorscheme slate
