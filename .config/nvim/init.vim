command W :execute ':silent w !sudo tee % > /dev/null' | :edit!
source ~/.config/nvim/plugins.vim
source ~/.config/nvim/airline.vim
let mapleader=" "
nnoremap <leader><leader> :noh<cr>
" Toggle folds (<Space>) {{{
nnoremap <silent> <C-space> :exe 'silent! normal! za'<CR>
  " }}}
" Formating text {{{
" auto indent file
nnoremap <leader>f <Esc>gg<s-V>G=''<Esc>zz
" }}}
" Easy quoting {{{
nnoremap <leader>' viw<esc>a'<esc>bi'<esc>
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>
vnoremap <leader>' di''<esc>P
vnoremap <leader>" di""<esc>P
" }}}
" Window navigation {{{
nnoremap <C-J> <c-w><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
if has("nvim")
    tnoremap <C-h> <C-\><C-n><C-w>h
    tnoremap <C-j> <C-\><C-n><C-w>j
    tnoremap <C-k> <C-\><C-n><C-w>k
    tnoremap <C-l> <C-\><C-n><C-w>l
endif
" }}}
" Disable navigation with arrow keys {{{
noremap <up> <Nop>
noremap <down> <Nop>
noremap <right> <Nop>
noremap <left> <Nop>
noremap <space> <Nop>
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
" vim-markdown-composer {{{
let g:markdown_composer_browser = 'chromium'
let g:markdown_composer_open_browser = 0
" }}}
nmap <F8> :TagbarToggle<CR>
"let g:markdown_composer_external_renderer='pandoc -f markdown -t html'
" vim:foldmethod=marker
augroup config-github-complete
        autocmd!
        autocmd FileType gitcommit setl omnifunc=github_complete#complete
    augroup END
let g:github_complete_enable_neocomplete = 1
