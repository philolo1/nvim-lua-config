let use_standard = 0

" let g:ale_linter_aliases = {'javascript': 'css'}

if (use_standard)
      let g:ale_javascript_standard_options = ' --parser babel-eslint --plugin decorators '
      let g:ale_linters = { 'javascript': ['standard'] }
      let g:ale_fixers = { 'javascript': ['standard'], 'typescript': ['standard'] }
      autocmd! bufwritepost *.js silent !standard % --parser babel-eslint --plugin decorators --fix
else
      " PRETTIER
      let g:ale_linters = { 'javascript': ['eslint', 'my'] }
      let b:ale_fixers = ['prettier', 'eslint']
      autocmd! bufwritepost *.js silent !prettier  % --write
endif

let g:ale_lint_on_save = 1
let g:ale_fix_on_save = 1
let g:ale_open_list = 1
