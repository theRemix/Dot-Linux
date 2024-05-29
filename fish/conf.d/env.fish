# set -g -x FZF_DEFAULT_COMMAND 'ag -g ""'
if not set -q __fish_path_set
  set -g __fish_path_set 1

  set -g -x EDITOR /home/remix/.local/bin/lvim
  set -g -x GIT_EDITOR $EDITOR
  set -g -x GOPATH ~/.gopath

  # for dap-install jsnode
  set -g -x NODE_OPTIONS --no-experimental-fetch

  set -U fish_user_paths ~/.local/bin $GOPATH/bin ~/.fzf/bin ~/.config/fnm/bin /usr/local/go/bin
end
