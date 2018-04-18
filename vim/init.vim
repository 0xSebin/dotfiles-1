" download plug if it does not exist
if empty(glob('~/dotfiles/vim/plug.vim'))
  silent !curl -fLo ~/dotfiles/vim/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" load plug (plugin manager)
so ~/dotfiles/vim/plug.vim

" load plugins
call plug#begin('~/dotfiles/vim/plugged')
Plug 'liuchengxu/space-vim-dark'
Plug 'gabrielelana/vim-markdown'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

" autoinstall plugins
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif

" initialize status line
let g:airline_theme='minimalist'

" intitialize color scheme
colorscheme space-vim-dark
hi Normal     ctermbg=NONE guibg=NONE
hi LineNr     ctermbg=NONE guibg=NONE
hi SignColumn ctermbg=NONE guibg=NONE

