cnoremap <expr> <C-p> pumvisible() ? '<Left>' : '<C-p>'
cnoremap <expr> <C-n> pumvisible() ? '<Right>' : '<C-n>'
cnoremap <expr> <Left> pumvisible() ? '<C-p>' : '<Left>'
cnoremap <expr> <Right> pumvisible() ? '<C-n>' : '<Right>'

runtime luarc.lua
" for catppuccin-mocha
hi! def link CursorColumn CursorLine
" highlight-groups, используемые vim-lsp для подсветки экспортнутых erlang-фукнкций
" hi! def link erlangLocalFuncCall Normal
" hi! def link LspSemanticFunction Function

