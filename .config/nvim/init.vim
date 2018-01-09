command W :execute ':silent w !sudo tee % > /dev/null' | :edit!
source ~/.config/nvim/plugins.vim
source ~/.config/nvim/airline.vim
let mapleader=" "
nnoremap <leader><leader> :noh<cr>
" Toggle folds (<Space>) {{{
nnoremap <silent> <C-space> :exe 'silent! normal! za'<CR>
  " }}}
" Disable navigation with arrow keys {{{
noremap <up> <Nop>
noremap <down> <Nop>
noremap <right> <Nop>
noremap <left> <Nop>
inoremap <up> <Nop>
inoremap <down> <Nop>
inoremap <right> <Nop>
inoremap <left> <Nop>
vnoremap <up> <Nop>
vnoremap <down> <Nop>
vnoremap <right> <Nop>
vnoremap <left> <Nop>
" }}}
"Autocompletion
let g:deoplete#enable_at_startup = 1
let g:SuperTabDefaultCompletionType = "<c-n>"

filetype plugin on
filetype indent on

set backspace=eol,start,indent
set whichwrap+=<,>,h,l


""""""""""""
"Searching"
""""""""""""
" Ignore case when searching set ignorecase
" When searching try to be smart about cases
set smartcase
" Highlight search results set hlsearch
" Makes search act like search in modern browsers
set incsearch

" Show matching brackets when text indicator is over them set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" enable folding
set foldmethod=syntax
set foldlevelstart=1
let javaScript_fold=1         " JavaScript
let sh_fold_enabled=1         " sh
let vimsyn_folding='af'       " Vim script
let xml_syntax_folding=1      " XML

" Editor stuff
set number
set ruler

syntax enable
colorscheme onedark
set background=dark

set guifont=Monospace\ Regular\ 13

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8
set autoindent
" Use Unix as the standard file type
set ffs=unix,dos,mac

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

" mouse scroll smooth
set cursorline!
set lazyredraw
set synmaxcol=256
syntax sync minlines=256

nmap <F8> :TagbarToggle<CR>
" vim:foldmethod=marker
