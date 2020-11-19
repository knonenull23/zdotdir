setopt share_history inc_append_history
setopt hist_{ignore_all_dups,save_no_dups}
setopt hist_{ignore_space,reduce_blanks,no_store}

bindkey ' ' magic-space

mkdir -p $HISTFILE:h

if (($+commands[zsh-history-enquirer])) then
  autoload history_enquire
  history_enquire
fi
