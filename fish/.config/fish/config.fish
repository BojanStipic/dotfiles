status is-interactive || exit 0

if status is-login && test -e /etc/profile
    exec bash -c 'source /etc/profile; exec fish'
end

starship init fish | source

fish_add_path --path ~/.local/bin ~/.cargo/bin ~/.npm/bin ~/.go/bin
set --global --export npm_config_prefix ~/.npm
set --global --export GOPATH ~/.go

set --global --export VISUAL nvim
set --global --export DIFFPROG 'nvim -d'
set --global --export MANPAGER 'nvim +Man!'
set --global --export BROWSER firefox

fish_config theme choose catppuccin-mocha
fish_vi_key_bindings
fish_vi_cursor
set fish_cursor_default block
set fish_cursor_insert line
set fish_cursor_replace_one underscore
set fish_cursor_replace underscore
set fish_cursor_visual block
set fish_autosuggestion_enabled 0
set fish_greeting

bind H beginning-of-line
bind L end-of-line
bind --mode insert \cp history-prefix-search-backward
bind --mode insert \cn history-prefix-search-forward
