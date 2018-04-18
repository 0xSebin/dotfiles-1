# https://github.com/supertassu/dotfiles
# .zshrc

source <(antibody init)
antibody bundle < ~/dotfiles/zsh_plugins.txt

export PATH="$HOME/dotfiles/bin:$HOME/.cargo/bin:$PATH"

eval "$(hub alias -s)"
eval "$(thefuck --alias)"
