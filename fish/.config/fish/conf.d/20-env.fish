status is-interactive || exit 0

fish_add_path --path --move \
    ~/.local/bin \
    ~/.local/share/cargo/bin \
    ~/.local/share/npm/bin
set --global --export RUSTUP_HOME ~/.local/share/rustup
set --global --export CARGO_HOME ~/.local/share/cargo
set --global --export GRADLE_USER_HOME ~/.local/share/gradle
set --global --export npm_config_prefix ~/.local/share/npm
set --global --export npm_config_cache ~/.cache/npm

set --global --export EDITOR nvim
set --global --export VISUAL nvim
set --global --export DIFFPROG 'nvim -d'
set --global --export MANPAGER 'nvim +Man!'
set --global --export BROWSER brave
