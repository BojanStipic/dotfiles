status is-interactive || exit 0

fish_add_path --path --move \
    ~/.local/bin \
    ~/.local/share/cargo/bin \
    ~/.local/share/go/bin \
    ~/.local/share/npm/bin
set --global --export RUSTUP_HOME ~/.local/share/rustup
set --global --export CARGO_HOME ~/.local/share/cargo
set --global --export GRADLE_USER_HOME ~/.local/share/gradle
set --global --export GOPATH ~/.local/share/go
set --global --export npm_config_prefix ~/.local/share/npm
set --global --export npm_config_cache ~/.cache/npm
set --global --export npm_config_userconfig ~/.config/npm/npmrc
set --global --export npm_config_init_module ~/.config/npm/npm-init.js
set --global --export npm_config_update_notifier false
set --global --export DOCKER_CONFIG ~/.config/docker
set --global --export KUBECONFIG ~/.config/kube/config.yaml
set --global --export KUBECACHEDIR ~/.cache/kube
set --global --export K9S_CONFIG_DIR ~/.config/k9s
set --global --export AWS_CONFIG_FILE ~/.config/aws/config
set --global --export AWS_SHARED_CREDENTIALS_FILE ~/.config/aws/credentials

set --global --export EDITOR nvim
set --global --export VISUAL nvim
set --global --export DIFFPROG 'nvim -d'
set --global --export MANPAGER 'nvim +Man!'
set --global --export BROWSER brave
set --global --export DO_NOT_TRACK true
