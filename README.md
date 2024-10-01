# Dot-Linux

Linux Dotfiles

## Setup

link configs (remove originals if needed)
```sh
ln -s ~/.dotfiles/fish ~/.config/fish
ln -s ~/.dotfiles/tmux.conf  ~/.tmux.conf
ln -s ~/.dotfiles/tmux-line.conf  ~/.config/tmux-line.conf
ln -s ~/.dotfiles/kitty/  ~/.config/kitty
```

Setup CyberNvim and link user config
```sh
git clone https://github.com/pgosar/CyberNvim ~/.config/nvim
ln -s ~/.dotfiles/CyberNvim ~/.config/nvim/lua/user
```

Install [fisherman](https://github.com/jorgebucaran/fisher?tab=readme-ov-file)

