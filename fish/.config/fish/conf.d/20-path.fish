status is-interactive || exit 0

fish_add_path --path --move ~/.local/bin ~/.cargo/bin ~/.npm/bin ~/.go/bin
set --global --export npm_config_prefix ~/.npm
set --global --export GOPATH ~/.go
