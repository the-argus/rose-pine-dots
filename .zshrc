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

autoload -Uz add-zsh-hook vcs_info

# CONFIG ----------------------------------------------------------------------

# VARS
# BOLD=$(echo -e "\e[01m")
# REGULAR=$(echo -e "\e[00m")
# COL1=$(echo -e "\e[31m")
# COL2=$(echo -e "\e[32m")
# COL3=$(echo -e "\e[33m")
# COL4=$(echo -e "\e[34m")
# COL5=$(echo -e "\e[35m")

BOLD="%B"
REGULAR="%f%b"
COL1="%F{red}"
COL2="%F{green}"
COL3="%F{yellow}"
COL4="%F{blue}"
COL5="%F{magenta}"

EDITOR=nvim
SUDO_EDITOR='/usr/bin/nvim'
#export PYENV_ROOT="$HOME/.local/src/pyenv"
#export PATH="$PYENV_ROOT/bin:$PATH"

#
# PROMPT CONFIG
#

# DEFAULTS ---------------
USER_STYLE="$COL3"
HOST_STYLE="$COL4"
DIR_STYLE="$COL5"
GIT_STYLE="$COL4"
PYTHON_STYLE="$COL3"
TIME_STYLE="$COL2"
MOD_SEP_STYLE="$BOLD$COL1"
USER_HOST_SEP_STYLE="$BOLD$COL1"
HOST_DIR_SEP_STYLE="$BOLD$COL1"

PROMPT_START="┬"
NAME_HOST_SEPARATOR="@"
HOST_DIR_SEPARATOR=":"
MODULE_SEPARATOR_START="─["
MODULE_SEPARATOR_END="]"
NEWLINE_PROMPT_START="╰─>$ "
BACKGROUND_JOB_CHAR="✦ "

MAIN_MODULE_SEPARATOR_START="$MODULE_SEPARATOR_START"
MAIN_MODULE_SEPARATOR_END="$MODULE_SEPARATOR_END"

# good characters:  or  or  or 
GIT_MODULE_SEPARATOR_START="${MODULE_SEPARATOR_START} "
GIT_MODULE_SEPARATOR_END="$MODULE_SEPARATOR_END"

# good characters: 🐍 or  or 
PYTHON_MODULE_SEPARATOR_START="${MODULE_SEPARATOR_START}python "
PYTHON_MODULE_SEPARATOR_END="$MODULE_SEPARATOR_END"

TIME_MODULE_SEPARATOR_START="${MODULE_SEPARATOR_START}"
TIME_MODULE_SEPARATOR_END="$MODULE_SEPARATOR_END"

# SETTINGS --------------
PROMPT_SHOW_GIT=true
PROMPT_SHOW_PYTHON=true
PROMPT_SHOW_TIME=true
MINIMUM_TIME=1

# if true, only shows hostname when an ssh program is running
SMART_HOSTNAME=true
# whether to show the hostname or not when smart hostname is disabled
SHOW_HOSTNAME=true


# OVERRIDES --------------
PROMPT_START=""
NAME_HOST_SEPARATOR=" at "
HOST_DIR_SEPARATOR=" in "
MODULE_SEPARATOR_START=" "
MODULE_SEPARATOR_END=" "
NEWLINE_PROMPT_START="❯ "
MAIN_MODULE_SEPARATOR_START=""
MAIN_MODULE_SEPARATOR_END=""
GIT_MODULE_SEPARATOR_START="${MODULE_SEPARATOR_START}on "
GIT_MODULE_SEPARATOR_END="$MODULE_SEPARATOR_END"
PYTHON_MODULE_SEPARATOR_START="${MODULE_SEPARATOR_START}using python "
PYTHON_MODULE_SEPARATOR_END="$MODULE_SEPARATOR_END"
TIME_MODULE_SEPARATOR_START="${MODULE_SEPARATOR_START}took "
TIME_MODULE_SEPARATOR_END="$MODULE_SEPARATOR_END"

USER_HOST_SEP_STYLE="$REGULAR"
HOST_DIR_SEP_STYLE="$REGULAR"
MOD_SEP_STYLE="$REGULAR"


# Enable substitution in the prompt.
setopt prompt_subst

#
# GITHUB MODULE CONFIG
#


# Run vcs_info on the precmd hook
# (output stored in vcs_info_msg_0)
add-zsh-hook precmd vcs_info

# check for unstaged changes
zstyle ':vcs_info:*' check-for-changes true

# set git changes characters
zstyle ':vcs_info:*' unstagedstr ' ?'
zstyle ':vcs_info:*' stagedstr ' +'

# VCS display format normally
zstyle ':vcs_info:git:*' formats       '%b%u%c'
# format when merging n stuff
zstyle ':vcs_info:git:*' actionformats '%b|%a%u%c'
#    %b the current branch name
#    %u are there any unstaged changes
#    %c are there any staged changes
#    %a the current Git action being performed


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

# PROMPT ----------------------------------------------------------------------

# UTILITY FUNCTIONS
function _exists() {
    command -v $1 > /dev/null 2>&1
}

function _running_job_char() {
    local job_running="$(jobs)"

    if [ -z "$job_running" ]; then
        return
    else
        echo $BACKGROUND_JOB_CHAR
    fi
}

# MODULES

function _main_module () {
    local module="${MOD_SEP_STYLE}${MAIN_MODULE_SEPARATOR_START}${REGULAR}"
    local dir=$(git rev-parse --show-toplevel 2>/dev/null)
    if [ -z "$dir" ]; then
        dir="%~"
    else
        dir=$(realpath --relative-to ${dir}/.. ${PWD})
    fi
    # name and host
    module="${module}${USER_STYLE}%n${REGULAR}"

    # smart hostname (only specify host if ssh is running)
    if [[ ! -z "$(ps aux | grep ssh | grep -v grep)" && $SMART_HOSTNAME == true ]]; then
        module="${module}${USER_HOST_SEP_STYLE}${NAME_HOST_SEPARATOR}${REGULAR}"
        module="${module}${HOST_STYLE}%m${REGULAR}"
    elif [[ $SMART_HOSTNAME == false && $SHOW_HOSTNAME == true ]]; then
        module="${module}${USER_HOST_SEP_STYLE}${NAME_HOST_SEPARATOR}${REGULAR}"
        module="${module}${HOST_STYLE}%m${REGULAR}"
    fi

    # current working directory
    module="${module}${HOST_DIR_SEP_STYLE}${HOST_DIR_SEPARATOR}${REGULAR}"
    module="${module}${DIR_STYLE}${dir}${REGULAR}"
    # end cap
    module="${module}${MOD_SEP_STYLE}${MAIN_MODULE_SEPARATOR_END}${REGULAR}"
    echo $module
}

function _git_module () {
    if [[ $PROMPT_SHOW_GIT == false ]]; then
        return
    fi
    
    local git_current_branch=$vcs_info_msg_0_

    if [ -z "$git_current_branch" ]; then
        return
    fi

    local module="${MOD_SEP_STYLE}${GIT_MODULE_SEPARATOR_START}${REGULAR}"
    module="${module}${GIT_STYLE}${vcs_info_msg_0_}${REGULAR}"
    module="${module}${MOD_SEP_STYLE}${GIT_MODULE_SEPARATOR_END}${REGULAR}"

    echo ${module}
}

function _python_module () {
    if [[ $PROMPT_SHOW_PYTHON == false ]]; then
        return
    fi
    
    # return if there is python installed in path
    _exists python || return
    
    # Show pyenv python version only for Python-specific folders
    if ! test -n "$(find . -maxdepth 1 -name '*.py' -print -quit)"
    then
        return
    fi
    

    local python_version=$(python --version)
    python_version=${python_version#Python }

    if [ -z "$python_version" ]; then
        return
    fi

    local module="${MOD_SEP_STYLE}${PYTHON_MODULE_SEPARATOR_START}${REGULAR}"
    module="${module}${PYTHON_STYLE}${python_version}${REGULAR}"
    module="${module}${MOD_SEP_STYLE}${PYTHON_MODULE_SEPARATOR_END}${REGULAR}"

    echo $module
}

function _start_module () {
    echo "${MOD_SEP_STYLE}${PROMPT_START}${REGULAR}"
}

function _newline_module () {
    NORMAL="${NEWLINE_PROMPT_START}$(_running_job_char)"
    INVERTED="$(_running_job_char)${NEWLINE_PROMPT_START}"
    echo "${MOD_SEP_STYLE}${INVERTED}${REGULAR}"
}

function _command_time_preexec() {
    if [[ $PROMPT_SHOW_TIME == true ]]; then
        export _LAST_TIME_ENTRY=0
        timer=${timer:-$SECONDS}
    fi
}

function _command_time_precmd() {
    if [[ $PROMPT_SHOW_TIME == true ]]; then
        if [ $timer ]; then
            local timer_show=$(($SECONDS - $timer))
            if [ -n "$TTY" ]; then
                export _LAST_TIME_ENTRY="$timer_show"
            fi
            unset timer
        fi
    fi
}

function _time_module() {
    if [[ -n "$_LAST_TIME_ENTRY" && $_LAST_TIME_ENTRY -ge $MINIMUM_TIME ]]; then
        
        local timer_show=$(
        [ $(($_LAST_TIME_ENTRY/3600)) -ne 0 ] && printf '%dh:' $(($_LAST_TIME_ENTRY/3600))
        [ $(($_LAST_TIME_ENTRY%3600/60)) -ne 0 ] || [ $(($_LAST_TIME_ENTRY/3600)) -ne 0 ] && printf '%2dm:' $(($_LAST_TIME_ENTRY%3600/60))
        printf '%2ds\n' $(($_LAST_TIME_ENTRY%60))
        )

        # the timer always has a space at the beginning for some reason
        # this removes it
        timer_show="${timer_show:1}"

        local module="${MOD_SEP_STYLE}${TIME_MODULE_SEPARATOR_START}${REGULAR}"
        module="${module}${TIME_STYLE}${timer_show}${REGULAR}"
        module="${module}${MOD_SEP_STYLE}${TIME_MODULE_SEPARATOR_END}${REGULAR}"
        echo $module
    fi
}

precmd_functions+=(_command_time_precmd)
preexec_functions+=(_command_time_preexec)

# THE PROMPT FR
prompt='$(_start_module)$(_main_module)$(_git_module)$(_python_module)$(_time_module)'$'\n''$(_newline_module)'



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
