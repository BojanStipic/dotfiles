status is-interactive || exit 0

fish_config theme choose catppuccin-mocha
set fish_greeting

fish_vi_key_bindings
bind H beginning-of-line
bind L end-of-line
bind --mode insert ctrl-p history-search-backward
bind --mode insert ctrl-n history-search-forward
bind --mode insert ctrl-f accept-autosuggestion
bind --mode insert ctrl-r history-pager
bind --mode insert ctrl-e edit_command_buffer
bind --mode insert ctrl-z 'fg 2>/dev/null; commandline -f repaint'

fzf --fish | source
starship init fish | source
