setopt {extended,ksh}_glob glob_star_short

alias mk{dir{{-,}p,},}='mkdir -p'
function mkdir {
  command mkdir ${${=1:+ -p $@}:-mkdir.$RANDOM}
  pushd $_
}
alias sbx=sandbox {mk,}t{e,}mp{,dir}=sandbox
autoload sandbox

alias symlink='ln -s' ln{-,}s=symlink

if (($+commands[npx])) then
  alias cp='npx cpy-cli'
  alias mv='npx move-file-cli'
else
  alias cp='cp -R'
fi

autoload zmv
alias mv=zmv {rnm,rename}=mv

if (($+commands[trash])) alias rm=trash

alias {exe,{+,}x}='chmod +x'
alias mode='stat -f %A'

# https://github.com/lsd-rs/lsd#lsd-lsdeluxe
if (($+commands[lsd])) then
  alias ls="XDG_CONFIG_HOME=$HOMEBREW_XDG_CONFIG_HOME lsd --literal"
  alias l{s{-,},}1='ls --oneline'
  alias l{,s-}l='ls --long --icon never'
  alias l{s{-,},}z='ll --blocks permission,size,date,git,name --sizesort'
  alias tree='ls --tree'
else
  alias ls='ls -A'
fi

alias edit="${=VISUAL:-$EDITOR} --goto"

alias reveal='open -R'
alias ql='qlmanage -p'
alias ql-refresh='pkill -9 [Qq]uick[Ll]ook; qlmanage -r'

if (($+commands[fd]))  alias find=fd

if (($+commands[bat])) alias cat='bat --paging never --style numbers'
