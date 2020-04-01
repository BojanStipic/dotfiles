#
# ~/.bash_aliases
#

alias vim='vim -p'
alias vimp='vim -i NONE -c "set noswapfile" -c "set noundofile"'
alias view='vim -R'
alias push='pushd .'
alias pop='popd'
export LS_COLORS="ow="
alias ls='ls --color=auto --human-readable --group-directories-first --classify'
export GREP_COLOR='38;5;203'
alias grep='grep --color=auto --perl-regexp'
alias diff='diff --color=auto'
alias dd='dd status=progress'
alias cp='cp --interactive'
alias mv='mv --interactive'
alias rm='rm --interactive=once'
alias df='df --human-readable -x tmpfs -x devtmpfs'
du() { command du --human-readable "$@" | sort --human-numeric-sort --reverse; }
alias free='free --human'
alias open='xdg-open'
alias calc='python -ic "import math as m; import cmath as cm"'
alias scan-150='scanimage --progress --format=jpeg >'
alias scan-300='scanimage --progress --format=jpeg --resolution=300 >'
alias mount.iso='gnome-disk-image-mounter'
alias ffprobe='ffprobe -hide_banner'
# List duplicate files in multiple directories
dupl() { find "$@" -maxdepth 1 | sort | uniq -di;}
# Scan all number types, not just int
alias scanmem='sudo scanmem --command="option scan_data_type number"'
# Mute/Unmute microphone
# to list all cards: `pactl list short sources`
# use @DEFAULT_SOURCE@ to mute the currently default source
alias mute='pactl set-source-mute @DEFAULT_SOURCE@ toggle'

# Bookmarks
alias storage='cd /mnt/storage'
alias projects='cd /mnt/storage/Projects/'
stash() {
	if [[ ! -b /dev/mapper/stash ]]; then
		sudo systemctl start systemd-cryptsetup@stash
		sudo mount /dev/mapper/stash /mnt/stash
	fi
	cd /mnt/stash/personal
}
alias ustash='cd && sudo umount /mnt/stash && sudo systemctl stop systemd-cryptsetup@stash'

# List all active daemons
alias ls-services='systemctl --type=service'
# List failed daemons
alias ls-failed='systemctl --failed'
# List error logs since boot
alias ls-log='journalctl -p err -b'
# List all samba users (add with `sudo smbpasswd -a username`)
alias ls-samba='sudo pdbedit -L'
# List all network connections
# -n	Numerical address (don't resolve),
# -a	Both listening and non-listening sockets
# -t	TCP protocol
# -p	Show process pid/name
alias ls-tcp='sudo ss -natp'
# -u	UDP protocol
alias ls-udp='sudo ss -naup'

# Update
alias up='sudo pacman -Syuu && yay -Su --aur --devel && gem update && rustup update'
# Remove package orphans
alias rm-orphans='sudo pacman -Rns $(pacman -Qdtq)'
# Remove pacman cache
alias rm-cache='sudo paccache -r; sudo paccache -ruk0'
# List modified configuration files
alias ls-modified-files='sudo pacman -Qii | sed -nE "s/^MODIFIED\s*(.*)/\1/p"'
# List installed native packages not in `base-devel`
alias ls-installed='comm -23 <(pacman -Qqen | sort) <(pacman -Qqg base-devel | sort)'

# rsync
# Copy files if mod-time or size is different
alias rsync='rsync -ah --partial --info=progress2,stats'
# Copy files if size is different
alias rsync-size='rsync --size-only'
# Copy files if checksum is different
alias rsync-checksum='rsync --checksum'
# Copy only files that do not already exist
alias rsync-simple='rsync --ignore-existing'
# Delete extraneous files from destination
alias rsync-backup='rsync --delete'

# curl
# Default METHOD is GET. Use -X to change
alias curl='curl -i'
alias curl-json='curl -H "Content-Type: application/json"'

# cmus daemon
# screen: -q quiet, -d detach elsewhere, -R reattach or create new, -S session name
alias cmus='screen -q -d -R -S cmus -s cmus'
alias cr='cmus-remote'

# mpv
alias mpv-fb='mpv --hwdec=no'
alias mpv-dvd='mpv dvd://'
alias mpv-cd='mpv cdda://'

# youtube-dl
alias youtube-dl='youtube-dl --ignore-errors '\
'--no-warnings '\
'--restrict-filenames '\
'--output="%(title)s.%(ext)s"'
# youtube-dl for playlists
alias youtube-dl-pl='youtube-dl --output="%(playlist)s/%(playlist_index)s - %(title)s.%(ext)s"'
# youtube-dl + convert to mp3
alias youtube-dl-audio='youtube-dl --format=bestaudio '\
'--extract-audio '\
'--audio-format mp3 --audio-quality 320K'

# Screencast with audio using ffmpeg
alias screencast='ffmpeg '\
'-f x11grab -video_size 1920x1080 -framerate 25 -i $DISPLAY '\
'-f pulse -ar 16000 -i default '\
'-c:v libx264 -preset superfast -c:a aac'

mime()
{
	TEMP=$(xdg-mime query filetype "$@")
	echo "Mime type: $TEMP"
	echo -n "Default open application: "
	xdg-mime query default "$TEMP"
	echo
}

img2pdf()
{
	TEMP="$(mktemp -d)"
	for img in "$@"; do
		convert -quality '85%' "$img" "$TEMP/${img%.*}.pdf"
	done
	pdfunite "$TEMP"/* out.pdf
	rm -rf "$TEMP"
}

# Astyle: Java style; indent with spaces
alias astyle='astyle --style=java '\
'--indent=spaces '\
'--break-blocks '\
'--pad-oper '\
'--pad-comma '\
'--pad-header '\
'--unpad-paren '\
'--delete-empty-lines '\
'--align-pointer=name '\
'--align-reference=name '\
'--break-one-line-headers '\
'--add-braces '\
'--convert-tabs '\
'--suffix=none'
alias astyle-java='astyle --mode=java'

# Colored man pages
man()
{
	env \
	LESS_TERMCAP_md=$'\E[01;38;5;203m' \
	LESS_TERMCAP_me=$'\E[0m' \
	LESS_TERMCAP_so=$'\E[38;5;246m' \
	LESS_TERMCAP_se=$'\E[0m' \
	LESS_TERMCAP_us=$'\E[04;38;5;210m' \
	LESS_TERMCAP_ue=$'\E[0m' \
	man "$@"
}

# Neofetch colors
alias neofetch='neofetch --colors 203 fg 203 203 203 fg '\
'--ascii_colors 203 203 '\
'--color_blocks off'
