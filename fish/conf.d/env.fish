# set -g -x FZF_DEFAULT_COMMAND 'ag -g ""'
if not set -q __fish_path_set
  set -g __fish_path_set 1

  set -g -x EDITOR /usr/bin/nvim
  set -g -x GIT_EDITOR $EDITOR
  set -g -x GOPATH ~/.gopath

  # set -U fish_user_paths ~/.local/bin $GOPATH/bin ~/.fzf/bin ~/.asdf/shims
  set -U fish_user_paths ~/.local/bin ~/.fzf/bin ~/.asdf/shims ~/.config/fnm/bin ~/.local/bin/nwjs-v0.60.0-linux-x64
end
