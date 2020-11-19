alias p=print
alias p{{-,}l,p}='print -l'
alias l=list
list() { print -l $@ | sort }
alias e=echo

alias {FPATH,fpath}='print -l $fpath'
alias   {PATH,path}='print -l $path'

alias {where,whence,type}=which
alias cmd=command
alias commands='print -l $commands | sort' cmds=commands
if (($+commands[bat])) aliases[commands]+=' | bat --plain --language js'
