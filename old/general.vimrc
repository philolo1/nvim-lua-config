let g:solarized_termcolors=256
set t_Co=256
syntax enable
set background=light
colorscheme solarized
set clipboard=unnamed

set shell=bash
" indentation
set autoindent
set smartindent
set shiftround

set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set smarttab

set ttimeout
set ttimeoutlen=0


"set path for find
set path=.,**
set wildmode=list:full
set wildignore+=*.a,*.o,*.out
set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png
set wildignore+=.DS_Store,*.git,*.hg,*.svn,*.svg
set wildignore+=*~,*.swp,*.tmp
set wildignore+=*~,*.class
set autoread
set hidden
set ttyfast
set showmatch
set incsearch
set hlsearch


" expand history of commands
set history=200
set scrolloff=1
" case insensitive when matching files.
set ignorecase
" " case sensitive if search string has cap letters
set smartcase
set mousehide "hide mouse while typing
set mouse=r
set nu
syntax on
filetype on
filetype plugin on
set number
set relativenumber

set number

set laststatus=2 showmode
" nice backspacing
set bs=2
set splitright


filetype plugin indent on


let g:solarized_termcolors=256
let g:solarized_visibility = "high"
let g:solarized_contrast = "high"
let g:vimshell_force_overwrite_statusline = 1
let g:vimshell_prompt_expr =
     \ 'escape($USER . ":". fnamemodify(getcwd(), ":~")."%", "\\[]()?! ")." "'
let g:vimshell_prompt_pattern = '^\f\+:\%(\f\|\\.\)\+% '



if executable('ag')
  let g:ackprg = 'ag --nogroup --nocolor --column'
endif


let g:python2_host_prog = '/usr/local/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'
set completeopt-=preview

set suffixesadd+=.js
set path+=$PWD/node_modules


if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor
  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif
let g:jsx_ext_required = 0 " Allow JSX in normal JS files

set colorcolumn=101
highlight ColorColumn ctermbg=red guibg=red



let g:UltiSnipsSnippetsDir=expand('~/.config/nvim/UltiSnips/')
let g:UltiSnipsSnippetDirectories=['UltiSnips']
" Expand snippet or return a space
let g:ulti_expand_res = 0
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

let g:match_words='(:),\[:\],{:},<:>,<\@<=\([^/][^ \t>]*\)[^>]*\%(\%(=\|/\)\@<!>\|$\):<\@<=/\1>'

" https://github.com/dart-lang/dart-vim-plugin/blob/master/README.md#how-do-i-configure-an-lsp-plugin-to-start-the-analysis-server
" let g:lsc_auto_map = v:true

