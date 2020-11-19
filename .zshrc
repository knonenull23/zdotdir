alias autoload='autoload -Uz'
alias zcompile='zcompile -Rz'

for _zwc ($^fpath/*.zwc(.N)) autoload $_zwc:t:r

_autoload=($ZDOTDIR/autoload/*.*(.N))
for _function ($_autoload) autoload $_function:t:r

if ([ ! -r $fpath[1].zwc ]||[ $_autoload[1]:h/*(.om[1]) -nt $fpath[1].zwc ]) then
  mktemp -d -t zcompile | read _tmp
  for _function ($_autoload) cp $_function $_tmp/$_function:t:r
  pushd -q $_tmp
  if (($#_autoload)) zcompile $fpath[1] *
  popd -q
  rm -rf $_tmp
fi

for _zsh ($PREFIX/share/zsh-*/*.zsh(xN)) source $_zsh
source <(< $ZDOTDIR/source/*.zsh(.N))

_pattern='_+([a-z])'
unalias -m $_pattern
unset   -m $_pattern REPLY

autoload add-zsh-hook compinit
compinit
