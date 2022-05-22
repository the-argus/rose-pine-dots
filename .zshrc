# history
setopt histignorealldups sharehistory
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# keybinding style
bindkey -v

# LOADING ---------------------------------------------------------------------

source ~/.aliases
source /usr/share/zsh/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.local/src/zsh-prompt/minimal.zsh

autoload -Uz add-zsh-hook vcs_info

# CONFIG ----------------------------------------------------------------------

EDITOR=nvim
SUDO_EDITOR='/usr/bin/nvim'
VISUAL=nvim
#export PYENV_ROOT="$HOME/.local/src/pyenv"
#export PATH="$PYENV_ROOT/bin:$PATH"

#
# PROMPT CONFIG
#

PROMPT_START=""
NAME_HOST_SEPARATOR=" at "
HOST_DIR_SEPARATOR=" in "
MODULE_SEPARATOR_START=" "
MODULE_SEPARATOR_END=" "
NEWLINE_PROMPT_START="❯ "
MAIN_MODULE_SEPARATOR_START=""
MAIN_MODULE_SEPARATOR_END=""
GIT_MODULE_SEPARATOR_START="${MODULE_SEPARATOR_START}on "
GIT_MODULE_SEPARATOR_END=""
PYTHON_MODULE_SEPARATOR_START="${MODULE_SEPARATOR_START}using python "
PYTHON_MODULE_SEPARATOR_END=""
TIME_MODULE_SEPARATOR_START="${MODULE_SEPARATOR_START}took "
TIME_MODULE_SEPARATOR_END=""

USER_HOST_SEP_STYLE="$REGULAR"
HOST_DIR_SEP_STYLE="$REGULAR"
MOD_SEP_STYLE="$REGULAR"

#
# AUTOCOMPLETION CONFIG
#

# minimum number of characters to type before autocomplete
zstyle ':autocomplete:*' min-input 1
# only insert up to common characters
zstyle ':autocomplete:*' insert-unambiguous yes
# dont move prompt up to make room for autocomplete very much
zstyle ':autocomplete:*' list-lines 4
# tab multiple times to move through menu
zstyle ':autocomplete:*' widget-style menu-select


# prompt module order
prompt='$(_start_module)$(_main_module)$(_time_module)$(_git_module)$(_python_module)'$'\n''$(_newline_module)'



# COLORS ----------------------------------------------------------------------

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
