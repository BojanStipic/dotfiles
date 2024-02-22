status is-interactive || exit 0

set --global --export FZF_DEFAULT_OPTS "--color=\
    bg+:#313244,\
    bg:#1e1e2e,\
    spinner:#f5e0dc,\
    hl:#f38ba8,\
    fg:#cdd6f4,\
    header:#f38ba8,\
    info:#cba6f7,\
    pointer:#f5e0dc,\
    marker:#f5e0dc,\
    fg+:#cdd6f4,\
    prompt:#cba6f7,\
    hl+:#f38ba8\
"

set FZF_BASE_COMMAND 'fd --follow --hidden --exclude .git'
set --global --export FZF_DEFAULT_COMMAND "$FZF_BASE_COMMAND --type f"
set --global --export FZF_CTRL_T_COMMAND "$FZF_BASE_COMMAND --type f"
set --global --export FZF_ALT_C_COMMAND "$FZF_BASE_COMMAND --type d"

fzf_key_bindings
