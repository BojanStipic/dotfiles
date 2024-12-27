status is-interactive || exit 0

alias nvim='nvim -p'
alias nview='nvim -R'
alias ls='eza --group-directories-first --classify --header --modified --created --git --icons'
alias tree='eza --tree --git-ignore'
alias rg='rg --smart-case'
alias diff='diff --color=auto'
alias cp='cp --interactive'
alias mv='mv --interactive'
alias rm='rm --interactive=once'
alias df='df --human-readable --exclude-type tmpfs --exclude-type devtmpfs'
function du --wraps='du'
    command du --human-readable $argv | sort --human-numeric-sort --reverse
end
alias free='free --human'
alias calc='python -ic "import math as m; import cmath as cm"'
alias ffprobe='ffprobe -hide_banner'

alias ls-services='systemctl --type=service'
alias ls-failed='systemctl --failed'
alias ls-log='journalctl --priority warning --boot'
alias ls-tcp='sudo ss --numeric --all --processes --tcp'
alias ls-udp='sudo ss --numeric --all --processes --udp'

alias up='sudo pacman -Syuu && paru -Su --aur --devel && rustup update'
alias rm-orphans='sudo pacman -Rns $(pacman -Qdtq)'
alias rm-cache='sudo paccache -r; sudo paccache -ruk0'
alias ls-modified-files='sudo pacman -Qii | sed -nE "s/^MODIFIED\s*(.*)/\1/p"'

alias rsync='rsync --archive --human-readable --partial --info=progress2,stats'
alias rsync-size='rsync --size-only'
alias rsync-checksum='rsync --checksum'
alias rsync-simple='rsync --ignore-existing'
alias rsync-backup='rsync --delete'

alias curl='curl --silent --show-error --dump-header /dev/stderr'
alias curl-json='curl -H "Content-Type: application/json"'

alias mpv-fb='mpv --hwdec=no'
alias mpv-dvd='mpv dvd://'
alias mpv-cd='mpv cdda://'

alias yt-dlp='yt-dlp --ignore-errors --no-warnings --restrict-filenames --output="%(title)s.%(ext)s"'
alias yt-dlp-pl='yt-dlp --output="%(playlist)s/%(playlist_index)s - %(title)s.%(ext)s"'
alias yt-dlp-audio='yt-dlp --format=bestaudio --extract-audio --audio-format opus'

alias mise-profile 'mise config set --file .mise.toml env.MISE_ENV'
complete --command mise-profile --no-files --arguments '(count .mise* >/dev/null && ls .mise* | string match --regex --groups-only "mise\.(.*)\.toml")'

alias aws-profile 'set --global --export AWS_PROFILE'
complete --command aws-profile --no-files --arguments '(aws configure list-profiles)'

alias kubectl-context 'kubectl config use-context'
alias kubectl-namespace 'kubectl config set-context --current --namespace'
complete --command kubectl-namespace --no-files --arguments '(kubectl get namespaces --output custom-columns=":metadata.name")'
abbr k kubectl
abbr kx kubectl-context
abbr kn kubectl-namespace
