" DoRemote function
function! DoRemote(arg)
  UpdateRemotePlugins
endfunction

" download plug if it does not exist
if empty(glob('~/.config/nvim/plug.vim'))
  silent !curl -fLo ~/.config/nvim/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" load plug (plugin manager)
so ~/.config/nvim/plug.vim

" load plugins
call plug#begin('~/.config/nvim/plugged')
"" Most plugins borrowed from https://github.com/nikitavoloboev/dotfiles/blob/master/nvim/init.vim

" fzf search
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" editorconfig support
Plug 'editorconfig/editorconfig-vim'

" looks
Plug 'ayu-theme/ayu-vim' " Theme.
Plug 'vim-airline/vim-airline' " Statusline
Plug 'vim-airline/vim-airline-themes' " Statusline

" Autocomplete base
" Plug 'neoclide/coc.nvim', {'branch': 'release'}

" MediaWiki
Plug 'm-pilia/vim-mediawiki'

" Markdown
Plug 'gabrielelana/vim-markdown'

" HOCON
Plug 'GEverding/vim-hocon'

call plug#end()

" autoinstall plugins
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif

" initialize status line
let g:airline_theme='ayu_dark'
let g:airline_powerline_fonts = 1 

" intitialize color scheme
" Theme
set background=dark " Set night mode
let ayucolor="dark" " Mirage version of theme
colorscheme ayu

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

" enable auto complete engine
let g:deoplete#enable_at_startup = 1

" keybindings
map <C-o><C-o> :FZF<CR>
map <C-o> :FZF ./

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

" tab settings
set tabstop=4 softtabstop=0 expandtab shiftwidth=2 smarttab

" mediawiki
let g:vim_mediawiki_site = 'www.mediawiki.org'

