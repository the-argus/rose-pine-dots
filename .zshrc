# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000
setopt extendedglob
unsetopt autocd beep nomatch notify
bindkey -v
# End of lines configured by zsh-newuser-install
plugins=(git gpg-agent ssh-agent)

#bindkey '^A' beginning-of-line
#bindkey '^E' end-of-line

source ~/.aliases

export EDITOR=nvim
export SUDO_EDITOR='/usr/bin/nvim'

# requires AUR zsh-autocomplete-git
source /usr/share/zsh/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh
# requires zsh-syntax-highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

eval "$(starship init zsh)"
