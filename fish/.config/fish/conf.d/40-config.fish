status is-interactive || exit 0

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
bind --mode insert \cp history-search-backward
bind --mode insert \cn history-search-forward

starship init fish | source
