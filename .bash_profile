#
# ~/.bash_profile
#

eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519

export FZF_DEFAULT_COMMAND='fdfind --type f --hidden --follow --exclude .git \
    --exclude .vim'

[[ -f ~/.bashrc ]] && . ~/.bashrc
