#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

function ls () { command ls --color=auto --group-directories-first "$@"; }

function lsl () {
	ls -la --color=always $1 | command grep "^d" && ls -la $1 | command grep -v "^d"
}

function diff () { command diff --color=auto "$@"; }

function grep () { command grep "$@" --color=always; }

function ip () { command ip -color=auto "$@"; }

function pc () { sudo pacman --color always "$@"; }

function pacman () { command pacman --color always "$@"; }

duk ()
{
   sudo du -k "$@" | sort -n
}

function ytd () { youtube-dl -f bestvideo+bestaudio --merge-output-format mkv --all-subs --cookies ~/.scripts/youtube.com_cookies.txt "$1"; }

eval "$(starship init bash)"

alias matrix="tmatrix -c default -C yellow -s 60 -f 0.2,0.3 -g 10,20 -l 1,50 -t \"hello, argus.\""
alias vim="nvim"
alias cageff="cage \"/bin/firefox -p Unconfigured\""

# alias ls='ls --color=auto'
# PS1='[\u@\h \W]\$ '

#!/bin/sh
if [ "$TERM" = "linux" ]; then
  /bin/echo -e "
  \e]P0403c58
  \e]P1ea6f91
  \e]P29bced7
  \e]P3f1ca93
  \e]P434738e
  \e]P5c3a5e6
  \e]P6eabbb9
  \e]P7faebd7
  \e]P86f6e85
  \e]P9ea6f91
  \e]PA9bced7
  \e]PBf1ca93
  \e]PC34738e
  \e]PDc3a5e6
  \e]PEeabbb9
  \e]PFffffff
  "
  # get rid of artifacts
  clear
fi

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
