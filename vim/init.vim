" DoRemote function
function! DoRemote(arg)
  UpdateRemotePlugins
endfunction

" download plug if it does not exist
if empty(glob('~/dotfiles/vim/plug.vim'))
  silent !curl -fLo ~/dotfiles/vim/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" load plug (plugin manager)
so ~/dotfiles/vim/plug.vim

" load plugins
call plug#begin('~/dotfiles/vim/plugged')
"" Most plugins borrowed from https://github.com/nikitavoloboev/dotfiles/blob/master/nvim/init.vim

" Utility
Plug 'romainl/vim-cool' " Stop matching after search is done.
Plug 'jiangmiao/auto-pairs' " Insert or delete brackets, parens, quotes in pair.
Plug 'w0rp/ale' " Asynchronous Lint Engine.
Plug 'honza/vim-snippets' " Snippet files for various programming languages.

Plug 'scrooloose/nerdcommenter' " Quick comments.
Plug 'Shougo/vimproc.vim', {'do' : 'make'} " Interactive command execution.
Plug 'tpope/vim-repeat' " Enable repeating supported plugin maps.
Plug 'tpope/vim-surround' " Quoting/parenthesizing made simple.
Plug 'junegunn/vim-easy-align' " Simple, easy-to-use alignment.
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " Fzf search
Plug 'junegunn/fzf.vim' " Fzf search.
Plug 'haya14busa/incsearch.vim' " Improved incremental searching.
Plug 'easymotion/vim-easymotion' " Vim motions on speed.
Plug 'thinca/vim-quickrun' " Run commands quickly.
Plug 'editorconfig/editorconfig-vim'

" Git
Plug 'tpope/vim-fugitive' " Git wrapper.
Plug 'mhinz/vim-signify' " Show a diff using Vim its sign column.
Plug 'airblade/vim-gitgutter' " Shows git diff in the gutter (sign column) and stages/undoes hunks.

" Deoplete
Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') } " Asynchronous completion framework.
Plug 'zchee/deoplete-jedi' " Deoplete source for jedi.

" C
Plug 'zchee/deoplete-clang', { 'for': 'c,cpp,objc' }

" Looks
Plug 'ayu-theme/ayu-vim' " Theme.
Plug 'vim-airline/vim-airline' " Statusline
Plug 'vim-airline/vim-airline-themes' " Statusline

" Go
Plug 'fatih/vim-go', { 'for': 'go' } " Go development.
Plug 'zchee/deoplete-go', { 'for': 'go', 'do': 'make'} " Asynchronous Go completion.

" Vim
Plug 'Shougo/neco-vim', { 'for': 'vim' } " Vim source for neocomplete/deoplete.

" Nix
Plug 'LnL7/vim-nix', { 'for': 'nix' } " Vim configuration files for Nix.

" Markdown
Plug 'gabrielelana/vim-markdown'

" JS
Plug 'pangloss/vim-javascript'

" HOCON
Plug 'GEverding/vim-hocon'
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
" Theme
set background=dark " Set night mode
let ayucolor="mirage" " Mirage version of theme
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
