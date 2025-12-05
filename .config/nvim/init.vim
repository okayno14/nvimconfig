
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath
source ~/.vimrc

cnoremap <expr> <C-p> pumvisible() ? '<Left>' : '<C-p>'
cnoremap <expr> <C-n> pumvisible() ? '<Right>' : '<C-n>'
cnoremap <expr> <Left> pumvisible() ? '<C-p>' : '<Left>'
cnoremap <expr> <Right> pumvisible() ? '<C-n>' : '<Right>'

runtime luarc.lua

" highlight-groups, используемые vim-lsp для подсветки экспортнутых erlang-фукнкций
" hi! link erlangLocalFuncCall Normal
" hi! link LspSemanticFunction Function

