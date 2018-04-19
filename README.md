# Dots

This is a copy of my dotfiles on my Kali machine.

## Setup

There is no automatic setup. Clone this repo (to `~/.dotfiles`) and add the following aliases to setup:

```shell
# link location -> link target
# ln -s target location
~/.config/nvim -> ~/dotfiles/vim
~/.hyper.js -> ~/dotfiles/hyper.js
~/.tmux.conf -> ~/dotfiles/tmux.conf
~/.fluxbox/keys -> ~/dotfiles/fluxbox/keys
```

Also, the following files have to be modified.

```shell
# ~/.zshrc
source ~/dotfiles/zshrc
```

Neovim automatically installs plugins when you first start it, however you have to restart before using all of them. 
