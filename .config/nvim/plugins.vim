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
Plug 'mboughaba/i3config.vim'
Plug 'sheerun/vim-polyglot'
Plug 'dhruvasagar/vim-table-mode'
Plug 'Yggdroot/indentLine'
Plug 'morhetz/gruvbox'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tpope/vim-surround'
Plug 'lilydjwg/colorizer'
Plug 'ap/vim-css-color'
Plug 'RRethy/vim-illuminate'
Plug 'matze/vim-move'
Plug 'euclio/vim-markdown-composer', { 'do': function('BuildComposer') }
Plug 'junegunn/vim-easy-align'
Plug 'Raimondi/delimitMate'
Plug 'majutsushi/tagbar'
Plug 'ervandew/supertab'
Plug 'joshdick/onedark.vim'
Plug 'Shougo/denite.nvim'
Plug 'Shougo/neopairs.vim'
Plug 'Shougo/neosnippet.vim'
Plug 'honza/vim-snippets'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'junegunn/fzf.vim', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf'
Plug 'myusuf3/numbers.vim'
Plug 'chrisbra/SudoEdit.vim'
Plug 'tpope/vim-fugitive'
Plug 'shumphrey/fugitive-gitlab.vim'
Plug 'tpope/vim-rhubarb'
Plug 'Shougo/deoplete.nvim'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
call plug#end()
