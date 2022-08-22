#
# ~/.bashrc
#

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
export BROWSER=firefox

#
# PATH
#
PATH="$PATH:$HOME/.local/bin"
PATH="$PATH:$HOME/.cargo/bin"
PATH="$PATH:$HOME/.npm/bin"
export npm_config_prefix="$HOME/.npm"

#
# PS1
#
#
# SPECIAL BASH SEQUENCES USED IN PS1:
# \u - the username of the current user
# \h - the hostname
# \w - the current working directory
# \n - newline
# \$ - if the effective UID is 0, a `#`, otherwise a `$`
#
# TERMINAL COLORS:
# \[ \] - Begin a sequence of non-printing characters
# \e - ASCII escape character 033. Begins an ANSI escape sequence
# \e[ - CSI Control Sequence
# Nm - where N is 30-37 (foreground) or 40-47 (background) color [4 bit colors]
# 38;5;Nm - where N is 0..255 color from xterm-color chart [8 bit colors]
# 38;2;R;G;Bm - where R, G and B are 0..255 colors [24 bit truecolor]
# 48;5;Nm and 48;2;R;G;Bm - same as above, but for background colors
#
RED='\[\e[31m\]'
WHITE='\[\e[00m\]'
LSEP='['
RSEP=']'
TOP=$'\u256D'$'\U2500'$'\U2500'
BOT=$'\u2570'\>
ST_OK=$'\u2714'
ST_ERR=$'\u2718'
STATUS='$((( $? == 0 )) && echo $ST_OK || echo $ST_ERR)'
# If running in a GNU Screen session
if [[ "$STY" ]]; then
	STATUS+=' S'
fi
# Number of background jobs
STATUS+='$([[ $(jobs) ]] && echo -n " " && jobs | wc -l)'
# Git status when the working directory is in a git repository
. /usr/share/git/git-prompt.sh &> /dev/null && GIT=1
. /usr/lib/git-core/git-sh-prompt &> /dev/null && GIT=1
if [[ "$GIT" ]]; then
	export GIT_PS1_SHOWDIRTYSTATE=1
	export GIT_PS1_SHOWSTASHSTATE=1
	export GIT_PS1_SHOWUNTRACKEDFILES=1
	export GIT_PS1_SHOWUPSTREAM="auto"
	GIT='$(__git_ps1 " %s")'
fi
PS1="$RED$TOP\u$WHITE@$RED\h$WHITE $LSEP $RED$STATUS$GIT$WHITE $RSEP $RED\w\n$RED$BOT\$$WHITE "

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
