setopt auto_cd chase_links
setopt auto_pushd pushd_{ignore_dups,to_HOME,minus,silent}

for _i ({2..6}) do
  printf -v _n        '.%.0s' {1..$_i}
  printf -v _parent '../%.0s' {2..${#_n}}
  alias {,cd}$_n="cd $_parent"
done

alias dirs='dirs -p'

if [ $TERM_PROGRAM = Apple_Terminal ] && $0:h:h/libexec/terminal-tabs.js
then
  defaults read com.apple.finder NewWindowTargetPath 2> /dev/null | read
  pushd ${REPLY#file://}
fi
