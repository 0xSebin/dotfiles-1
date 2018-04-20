# https://github.com/supertassu/dotfiles
# .zshrc

autoload -U promptinit; promptinit;

source <(antibody init)
antibody bundle < ~/dotfiles/zsh_plugins.txt

export PATH="$HOME/dotfiles/bin:$HOME/.cargo/bin:$HOME/.yarn/bin:./node_modules/.bin:$PATH"
export PURE_CMD_MAX_EXEC_TIME=2

eval "$(hub alias -s)"
eval "$(thefuck --alias)"

alias vim="nvim"
alias top="vtop"
alias ls="ls --color=auto"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
