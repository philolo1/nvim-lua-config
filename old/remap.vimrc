let g:mapleader=" "


" let g:UltiSnipsExpandTrigger="<c-j>"
" let g:UltiSnipsJumpForwardTrigger="<Leader>n"
" let g:UltiSnipsJumpBackwardTrigger="<Leader>N"
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-l>"
let g:UltiSnipsJumpBackwardTrigger="<c-h>"


nmap <Leader>c gcc     " command out
vmap <Leader>c gc     " command out

nnoremap <Leader>e :e <C-R>=expand('%:p:h') . '/'<CR>

nmap j gj
nmap k gk
nmap <Leader>y "ayy
nmap <Leader>p "ap
nmap <c-z> :QuickRun<CR>

nmap <C-e> :vsplit %%

imap <C-k> <Plug>snipMateNextOrTrigger
smap <C-k> <Plug>snipMateNextOrTrigger

nmap J }
nmap K {
vmap J }
vmap K {
noremap ' :wa<Enter>
noremap <C-i> :ImportJSFix<CR>


command! V : e ~/.config/nvim/init.vim
command! F : e ~/.config/fish/config.fish
command! Reload : source ~/.config/nvim/init.vim
command! R : source ~/.config/nvim/init.vim
command! DeleteMultipleLines :silent! %s/\(\n\n\)\n\+/\1/
command! DeleteMultipleLines2 :silent! %s/\s\+$//
command! UltiSnippetEdit vsplit ~/.config/nvim/UltiSnips/javascript.snippets


cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" Terminal
tnoremap <Esc> <C-\><C-n>

command! P : e /Users/philolo1/.local/share/nvim/plugged/ultisnips/pythonx/UltiSnips/snippet_manager.py



cnoreabbrev Ag Ack

