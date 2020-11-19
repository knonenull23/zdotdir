case $1 in
  i|install) command code --install-extension ${@:2};;
  *) command code $@
esac
