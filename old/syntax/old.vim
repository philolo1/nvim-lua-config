source ~/.config/nvim/plugins.vimrc

let use_standard = 0

if (use_standard)
  let g:ale_javascript_standard_options = ' --parser babel-eslint --plugin decorators '
  " let g:ale_javascript_standard_options = '--plugin decorators '
  let g:ale_linters = { 'javascript': ['standard'] }
  let g:ale_fixers = { 'javascript': ['standard'], 'typescript': ['standard'] }
  autocmd! bufwritepost *.js silent !standard % --parser babel-eslint --plugin decorators --fix
else
  " PRETTIER
  let g:ale_linters = { 'javascript': ['eslint', 'my'], 'typescript': ['eslint','tslint', 'tsserver', 'typecheck', 'xo'] }
  " let g:ale_linters = { 'javascript': ['eslint', 'my'], 'typescript': [] }
  let b:ale_fixers = ['prettier', 'eslint']
  autocmd! bufwritepost *.js silent !prettier  % --write
  autocmd! bufwritepost *.tsx silent !prettier  % --write
  autocmd! bufwritepost *.ts silent !prettier  % --write
endif

let g:ale_lint_on_save = 1
let g:ale_fix_on_save = 1
let g:ale_open_list = 1

let g:lsc_enable_autocomplete = v:false


source ~/.config/nvim/general.vimrc
source ~/.config/nvim/remap.vimrc
source ~/.config/nvim/autocmd.vimrc

nmap <Leader>d <Plug>(coc-definition)
nmap <Leader>R <Plug>(coc-references)
nmap <Leader>r <Plug>(coc-rename)
nmap <Leader>f :call <SID>show_documentation()<CR>


" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)





function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction


nmap <leader>a  <Plug>(coc-codeaction-selected)w

command! FlutterRun : CocCommand flutter.run
command! FlutterRunChrome : CocCommand flutter.run -d chrome
command! FlutterRunAndroid : CocCommand flutter.run -d 98KAYS00D9B
command! FlutterRunIOS : CocCommand flutter.run -d A797ADE4-6EAB-4652-BE72-334618CF2564
command! FlutterOpenDebug : CocCommand flutter.dev.openDevLog
command! FlutterHotReload : CocCommand flutter.dev.hotReload
command! FlutterHotRestart : CocCommand flutter.dev.hotRestart

let g:localvimrc_whitelist=['~/kawazu/flutter-survey/survey/.lvimrc']




" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif







hi CocInfoSign ctermfg=Brown guifg=#fab005



let g:python3_host_prog = "/usr/local/opt/python@3.9/bin/python3.9"
