if ((!$+commands[anka])) return

alias vm=anka

case $1 in
  -v|--version) command anka version;;
  -h|help) command anka --help;;
  list|ls) ANKA_TABLE_FMT=simple command anka list --field name -f uuid -f status;;
  info) command anka describe ${@:2};;
  view) command anka start --$@ && $0:h/lib/anka.js;;
  restart) command anka reboot ${@:2};;
  rm|del) command anka delete ${@:2};;
  reg*) command anka registry ${@:2};;
  stop) command anka $@ --force
  *) command anka $@
esac
