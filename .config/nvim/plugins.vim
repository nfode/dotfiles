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
"Plug 'rhysd/github-complete.vim'
"Plug 'jaxbot/github-issues.vim'
Plug 'lilydjwg/colorizer'
Plug 'ap/vim-css-color'
Plug 'matze/vim-move'
Plug 'euclio/vim-markdown-composer', { 'do': function('BuildComposer') }
Plug 'rhysd/vim-gfm-syntax'
Plug 'vimwiki/vimwiki'
Plug 'stephpy/vim-yaml'
Plug 'junegunn/seoul256.vim'
Plug 'junegunn/vim-easy-align'
Plug 'Raimondi/delimitMate'
Plug 'hzchirs/vim-material'
Plug 'majutsushi/tagbar'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'ervandew/supertab'
Plug 'joshdick/onedark.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vimwiki/vimwiki', { 'branch': 'dev' }
call plug#end()
