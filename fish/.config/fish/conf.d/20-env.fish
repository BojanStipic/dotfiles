status is-interactive || exit 0

fish_add_path --path ~/.local/bin ~/.cargo/bin ~/.npm/bin ~/.go/bin
set --global --export npm_config_prefix ~/.npm
set --global --export GOPATH ~/.go

set --global --export VISUAL nvim
set --global --export DIFFPROG 'nvim -d'
set --global --export MANPAGER 'nvim +Man!'
set --global --export BROWSER firefox
