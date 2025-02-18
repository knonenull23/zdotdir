setopt all_export pipe_fail glob_assign

typeset -U path
source /etc/profile
source <(brew shellenv)

PREFIX=${HOMEBREW_PREFIX:-/usr}

source <(< {$PREFIX/share/zsh-*,$ZDOTDIR/source}/*.env(f[u-x]N))

unsetopt all_export
