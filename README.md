# Dot-Linux

Linux Dotfiles

## Setup

link configs (remove originals if needed)
```sh
ln -s ~/.dotfiles/fish ~/.config/fish
ln -s ~/.dotfiles/tmux.conf  ~/.tmux.conf
ln -s ~/.dotfiles/nvim/  ~/.config/nvim
```

install vim-plug
```sh
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

install plugins in nvim
`nvim -c :PlugInstall`
