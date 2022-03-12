# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000
setopt extendedglob
unsetopt autocd beep nomatch notify
bindkey -v
# End of lines configured by zsh-newuser-install
plugins=(git gpg-agent ssh-agent)

source ~/.aliases

eval "$(starship init zsh)"

export EDITOR=nvim
export SUDO_EDITOR='/usr/bin/nvim'


