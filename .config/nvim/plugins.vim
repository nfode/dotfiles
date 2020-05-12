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
" color themes and more for different languages
Plug 'mboughaba/i3config.vim'
Plug 'masukomi/vim-markdown-folding'

" nerdtree
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'

" language server
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" highlight word under the cursor
Plug 'RRethy/vim-illuminate'

" markdown
Plug 'euclio/vim-markdown-composer', { 'do': function('BuildComposer') }
Plug 'dhruvasagar/vim-table-mode'

" completion
"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

Plug 'junegunn/fzf.vim', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf'

" toogle relative line numbers
Plug 'myusuf3/numbers.vim'

" color themes
Plug 'joshdick/onedark.vim'
Plug 'morhetz/gruvbox'
"
" statusline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" git
Plug 'tpope/vim-fugitive'
Plug 'shumphrey/fugitive-gitlab.vim'
Plug 'airblade/vim-gitgutter'

" misc
Plug 'lilydjwg/colorizer' " colorize hex and rgb color
Plug 'Yggdroot/indentLine' " display intendation
Plug 'Raimondi/delimitMate' " complete quotes, parens, brackets, etc.
"Plug 'ervandew/supertab' " dont use tab for completion
Plug 'tpope/vim-surround'
Plug 'chrisbra/SudoEdit.vim'

Plug 'rhysd/vim-crystal'

call plug#end()
