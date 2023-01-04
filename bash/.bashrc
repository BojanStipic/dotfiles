# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Don't put duplicate lines or lines starting with a space in the history
HISTCONTROL=ignoreboth
# Colon-separated list of patterns not saved in the history
HISTIGNORE='fg:cd:ls:mpv*:youtube-dl*'
# Increase the history size from the default 500
HISTSIZE=1000

# Append to the history file, don't overwrite it
shopt -s histappend
# Pattern `**` used in a pathname expansion context will match paths recursively
shopt -s globstar
# Range expressions behave as if in the traditional C locale
shopt -s globasciiranges
# Update the window size
[[ $DISPLAY ]] && shopt -s checkwinsize

# Disable C-s suspend execution
stty -ixon

#
# Default applications
#
export VISUAL=nvim
export DIFFPROG='nvim -d'
export BROWSER=firefox

#
# PATH
#
PATH="$PATH:$HOME/.local/bin"
PATH="$PATH:$HOME/.cargo/bin"
PATH="$PATH:$HOME/.npm/bin"
export npm_config_prefix="$HOME/.npm"

eval "$(starship init bash)"

#
# fzf
#
if type fzf &> /dev/null; then
	FZF_BASE_COMMAND='fd --follow --hidden --exclude .git'
	export FZF_DEFAULT_COMMAND="$FZF_BASE_COMMAND --type f"
	export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
	export FZF_ALT_C_COMMAND="$FZF_BASE_COMMAND --type d"
	. /usr/share/fzf/completion.bash &> /dev/null
	. /usr/share/fzf/key-bindings.bash &> /dev/null
	. /usr/share/bash-completion/completions/fzf &> /dev/null
	. /usr/share/doc/fzf/examples/key-bindings.bash &> /dev/null
fi

#
# Include ~/.bash_aliases
#
if [[ -f ~/.bash_aliases ]]; then
	. ~/.bash_aliases
fi
