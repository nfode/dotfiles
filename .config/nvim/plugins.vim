call plug#begin('~/.local/share/nvim/plugged')
function! BuildComposer(info)
  if a:info.status != 'unchanged' || a:info.force
    if has('nvim')
      !cargo build --release
    else
      !cargo build --release --no-default-features --features json-rpc
    endif
  endif
endfunction
Plug 'Yggdroot/indentLine'
Plug 'morhetz/gruvbox'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tpope/vim-surround'
Plug 'lilydjwg/colorizer'
Plug 'ap/vim-css-color'
Plug 'matze/vim-move'
Plug 'euclio/vim-markdown-composer', { 'do': function('BuildComposer') }
Plug 'rhysd/vim-gfm-syntax'
Plug 'stephpy/vim-yaml'
Plug 'junegunn/vim-easy-align'
Plug 'Raimondi/delimitMate'
Plug 'majutsushi/tagbar'
Plug 'ervandew/supertab'
Plug 'joshdick/onedark.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'junegunn/fzf.vim', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf'
"Plug 'vimwiki/vimwiki', { 'branch': 'dev' }
Plug 'vim-pandoc/vim-pandoc',{ 'for': 'pandoc' }
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'myusuf3/numbers.vim'
Plug 'chrisbra/SudoEdit.vim'
call plug#end()
