" load plug (plugin manager)
so ~/dotfiles/vim/plug.vim

" load plugins
call plug#begin('~/dotfiles/vim/plugged')
Plug 'liuchengxu/space-vim-dark'
call plug#end()

" intitialize color scheme
colorscheme space-vim-dark
hi Normal     ctermbg=NONE guibg=NONE
hi LineNr     ctermbg=NONE guibg=NONE
hi SignColumn ctermbg=NONE guibg=NONE

