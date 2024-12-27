status is-interactive || exit 0

if status is-login && test -e /etc/profile
    exec bash -c 'source /etc/profile; exec $(grep --max-count 1 fish /etc/shells)'
end
