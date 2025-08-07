# set -g -x FZF_DEFAULT_COMMAND 'ag -g ""'
if not set -q __fish_path_set
  set -g __fish_path_set 1

  set -g -x EDITOR /opt/nvim-linux64/bin/nvim
  set -g -x GIT_EDITOR $EDITOR
  set -g -x GOPATH ~/.gopath
  set -g -x GOBIN $GOPATH/bin

  # for dap-install jsnode
  set -g -x NODE_OPTIONS --no-experimental-fetch

  set -U fish_user_paths ~/.local/bin $GOBIN ~/.fzf/bin ~/.config/fnm/bin /usr/local/go/bin /opt/nvim-linux64/bin
end
