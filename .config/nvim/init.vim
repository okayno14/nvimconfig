runtime luarc.lua

if file_readable("./.vimrc")
    so ./.vimrc
endif

cnoremap <expr> <C-p> pumvisible() ? '<Left>' : '<C-p>'
cnoremap <expr> <C-n> pumvisible() ? '<Right>' : '<C-n>'
cnoremap <expr> <Left> pumvisible() ? '<C-p>' : '<Left>'
cnoremap <expr> <Right> pumvisible() ? '<C-n>' : '<Right>'

