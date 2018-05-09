" download plug if it does not exist
if empty(glob('~/dotfiles/vim/plug.vim'))
  silent !curl -fLo ~/dotfiles/vim/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" load plug (plugin manager)
so ~/dotfiles/vim/plug.vim

" load plugins
call plug#begin('~/dotfiles/vim/plugged')
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'gabrielelana/vim-markdown'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'danro/rename.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'airblade/vim-gitgutter'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'xojs/vim-xo'
Plug 'chrisbra/NrrwRgn'
Plug 'wokalski/autocomplete-flow'
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
call plug#end()

" autoinstall plugins
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif

" initialize status line
let g:airline_theme='deus'
let g:airline_powerline_fonts = 1 

" intitialize color scheme
color dracula
hi Normal     ctermbg=NONE guibg=NONE
hi LineNr     ctermbg=NONE guibg=NONE ctermfg=BLUE
hi SignColumn ctermbg=NONE guibg=NONE

" enable line numbers by default
set number

" disable spell checker
set nospell

" use search highlighting
set hlsearch

" highlight trailing whitespaces
highlight ExtraWhitespace ctermbg=red guibg=red
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red

" keybindings
map <C-o><C-o> :FZF<CR>
map <C-o> :FZF ./

" enable deoplete (auto completer)
let g:deoplete#enable_at_startup = 1

" configure fzf
let g:fzf_layout = { 'left': '~25%' }
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

" style window split bar
set fillchars+=vert:│
autocmd ColorScheme * highlight VertSplit cterm=NONE ctermfg=Green ctermbg=NONE
