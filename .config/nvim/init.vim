" {{{ source config files
source ~/.config/nvim/plugins.vim
source ~/.config/nvim/airline.vim
" }}}
" {{{ set leader
let mapleader=" "
" }}}
" {{{ toogle relative numbers
nnoremap <leader>rl :set relativenumber!<cr>
" }}}
" {{{ disable highlighting after search
nnoremap <leader><leader> :noh<cr>
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
" Toggle folds (<Space>) {{{
nnoremap <silent> <C-space> :exe 'silent! normal! za'<CR>
" }}}
" Formating text {{{
" auto indent file
nnoremap <leader>f <Esc>gg<s-V>G=''<Esc>zz
" }}}
" Searching {{{
" Ignore case when searching set ignorecase
" When searching try to be smart about cases
set smartcase
" Highlight search results set hlsearch
" Makes search act like search in modern browsers
set incsearch
" }}}
" {{{ No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500
" }}}
" {{{ Editor stuff
filetype plugin on
filetype indent on
set splitright
set splitbelow
set listchars=tab:>·,trail:~,extends:>,precedes:<,space:⋅
set list
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

set hidden

" How many tenths of a second to blink when matching brackets
set mat=2

set number
set ruler

syntax enable
set termguicolors
" {{{ toggle light
function! Light()
    echom "set bg=light"
    set background=light
    colorscheme gruvbox
    AirlineTheme gruvbox
endfunction

function! Dark()
    echom "set bg=dark"
    set background=dark
    colorscheme onedark
   "    set nolist
endfunction
function! ToggleLightDark()
    if &bg ==# "light"
        call Dark()
    else
        call Light()
    endif
endfunction
nnoremap <leader>c :call ToggleLightDark()<CR>
" }}}

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8
set autoindent
" Use Unix as the standard file type
set ffs=unix,dos,mac

"let g:table_mode_corner='|'
let g:vim_json_syntax_conceal = 0

let g:indentLine_fileTypeExclude = ['markdown', 'json']

set concealcursor=
set conceallevel=0
let g:vim_markdown_conceal = 0
let g:tex_conceal = ""
let g:vim_markdown_math = 1

" }}}
" {{{ Text, tab and indent related
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
" }}}
" markdown {{{
" pandoc {{{
let g:pandoc#modules#disabled=["bibliographies"]
let g:pandoc#command#autoexec_on_writes = 1
let g:pandoc#filetypes#handled = ["pandoc"]
let g:pandoc#filetypes#pandoc_markdown = 0
" }}}
" vim-markdown-composer {{{
let g:markdown_composer_browser = 'chromium'
let g:markdown_composer_open_browser = 0
autocmd BufRead,BufNewFile *.md	setlocal filetype=markdown
" }}}
" }}}
" Editing config files {{{
nnoremap <leader>rc :vsplit $HOME/.config/nvim/init.vim<cr>
nnoremap <leader>boot :vsplit $HOME/.yadm/bootstrap<cr>
" source config in all windows
nnoremap <leader>src :windo source $HOME/.config/nvim/init.vim<cr><esc>:echo "sourced vimrc"<cr>
nnoremap <leader>todo :vsplit $HOME/todo<cr>
" }}}
" fzf {{{ 
" Mapping selecting mappings
if executable('fzf')
    nmap <leader>map <plug>(fzf-maps-n)
    nnoremap <silent> <c-f> :FZF -m<cr>
else
    let g:ctrlp_map = '<c-f>'
end

" }}}
" {{{ buffers,tabs 
" Window navigation {{{
" Smart way to move between windows
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

" Close the current buffer
map <leader>bd :Bclose!<cr>:tabclose<cr>gT

" Close all the buffers
map <leader>ba :bufdo bd<cr>

map <A-l> :bnext<cr>
map <A-h> :bprevious<cr>

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
"map <leader>tc :tabclose<cr>
map <leader>tm :tabmove 
map <leader>tl :tabnext 1 <cr>
map <leader>th :tabprevious 1 <cr>

" Let 'tl' toggle between this and the last accessed tab
let g:lasttab = 1
nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers 
try
    set switchbuf=useopen,usetab,newtab
    set stal=2
catch
endtry

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
" }}}
" {{{ find selections
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>
" }}}
" {{{ NERDTree
map <leader>n :NERDTreeToggle<cr>
map <leader>nf :NERDTreeFocus<cr>
" Auto start NERD tree when opening a directory
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | wincmd p | endif

" Auto start NERD tree if no files are specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | exe 'NERDTree' | endif

" Let quit work as expected if after entering :q the only window left open is NERD Tree itself
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif 
" }}}
" {{{ init 
silent call Dark()
autocmd VimEnter * wincmd p
" }}} 
" {{{ yaml
au! BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
" }}}
" {{{ move stuff with A-j and A-k
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv
" }}}

let g:tex_flavor = "latex"
