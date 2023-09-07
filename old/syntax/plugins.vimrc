call plug#begin('~/.local/share/nvim/plugged')

"Color scheme
Plug 'altercation/vim-colors-solarized'

" commentary
Plug 'tpope/vim-commentary'

Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'

Plug 'HerringtonDarkholme/yats.vim'
Plug 'tpope/vim-repeat'

Plug 'tmhedberg/matchit'

Plug 'tmux-plugins/vim-tmux-focus-events'

Plug 'roxma/vim-tmux-clipboard'
"
Plug 'mileszs/ack.vim'

Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

" " " Follow https://jaxbot.me/articles/setting-up-vim-for-react-js-jsx-02-03-2015
"
" Plug 'ruanyl/vim-fixmyjs'
Plug 'tpope/vim-fugitive'
Plug 'w0rp/ale'

Plug 'ctrlpvim/ctrlp.vim'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

"
Plug 'honza/vim-snippets'
"
Plug 'thinca/vim-quickrun'
"
Plug 'scrooloose/nerdtree'
"
Plug 'moll/vim-node'
"
" "Python
Plug 'vim-scripts/indentpython.vim'
"
"
" " import js
Plug 'Galooshi/vim-import-js'
Plug 'ianks/vim-tsx'
Plug 'idanarye/vim-merginal'

Plug 'tpope/vim-scriptease'

"Plug 'MarcWeber/vim-addon-mw-utils'
"Plug 'tomtom/tlib_vim'
"Plug 'garbas/vim-snipmate'
"Plug 'honza/vim-snippets'
"
" Dart
Plug 'dart-lang/dart-vim-plugin'
" Plug 'natebosch/vim-lsc'
" Plug 'natebosch/vim-lsc-dart'


" Local init.vim
Plug 'embear/vim-localvimrc'

" Startify
Plug 'mhinz/vim-startify'

" Telescope Search
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }

" Rust
Plug 'rust-lang/rust.vim'

Plug 'sk1418/QFGrep'


Plug 'othree/html5.vim'
Plug 'pangloss/vim-javascript'
Plug 'evanleck/vim-svelte', {'branch': 'main'}

"Astro
Plug 'wuelnerdotexe/vim-astro'

"
call plug#end()

