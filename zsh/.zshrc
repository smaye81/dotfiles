export EDITOR=vim

[ -s "/usr/local/bin/virtualenvwrapper.sh" ] && . /usr/local/bin/virtualenvwrapper.sh

which rbenv >/dev/null && eval "$(rbenv init -)"

_sync_dir () {
    cmd=$1
    shift
    new_directory=$(boxer sync_dir $@)
    if [ "$?" -eq "0" ]; then
        $cmd $new_directory
    else
        echo "$new_directory"
    fi
}
cdsync () {
    _sync_dir cd $@
}
editsync () {
    _sync_dir $EDITOR $@
}
opensync () {
    _sync_dir open @
}
# END added by newengsetup

# does a find/replace for all files in a directory recursively
# arg1: find
# arg2: replace
sed_all_files_in_dir() {
    find . -type f | grep -v '^./.git' | sed_all_files "${1}" "${2}"
}

# does a find/replace for all files in a directory recursively
# arg1: find
# arg2: replace
sed_all_files_in_git() {
    git ls-files | sed_all_files "${1}" "${2}"
}

# does a find/replace for all files in stdin
# arg1: find
# arg2: replace
# if DRY set, this prints the sed commands
sed_all_files() {
    local tmpfile=./tmp.$$
    while IFS= read -r i; do
        # could be a symlink directory
        if [ ! -d "${i}" ]; then
            if grep "${1}" "${i}" >/dev/null; then
                if [ -n "${DRY}" ]; then
                    echo sed "s/${1}/${2}/g" "${i}"
                else
                    sed "s/${1}/${2}/g" "${i}" > "${tmpfile}"
                    mv "${tmpfile}" "${i}"
                fi
            fi
        fi
    done
}

# Call this function to set a color scheme and also set it to vimrc background
# This fixes the green lines in Vim
set_base16() {
  base16_$1
  echo "colorscheme base16-$1" > ~/.vimrc_background
}

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        source "$BASE16_SHELL/profile_helper.sh"

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="blinks"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

# User configuration

unset GOARCH;
export GOPATH='~/Projects/go'

export PATH="/usr/local/opt/findutils/libexec/gnubin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
if [ -n "$HOMEBREW_PREFIX" ]; then
  export PATH="$HOMEBREW_PREFIX/bin:$PATH"
fi

# Using this path causes vim to have 256 color issues with green lines
# export PATH="/usr/local/opt/findutils/libexec/gnubin:$HOMEBREW_PREFIX/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$HOME/bin"

export PATH="${GOPATH}/bin:${PATH}";
# export PATH=$HOME/Library/Python/3.9/bin:$PATH
export PATH=$HOME/dart/flutter/bin:$PATH
export PATH="$MY_INSTALL_DIR/bin:$PATH"

#source ~/.cargo/env

#go version >&2;
#protoc --version >&2
#dart --version >&2
#python3 --version >&2
#cargo --version >&2

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Personal aliases
alias gopath="cd $GOPATH"
alias glog="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

# Search everything, including hidden dirs and files, but ignore the .git directory
alias agall="ag --hidden --ignore .git"

# Switch to a Mac when using a KVM switch on Linux
# This switches from a DisplayPort on Linux to a USB-C on Mac
alias gomac="ddcutil setvcp 60 0x04"

# ======= Personal zsh/bash functions

# fuzzy grep open via ag
vg() {
  local file

  file="$(ag --nobreak --noheading $@ | fzf -0 -1 | awk -F: '{print $1}')"

  if [[ -n $file ]]
  then
     vim $file
  fi
}

gopkgcover() {
  local OUT_FILE="/tmp/gopkgcover.out"
  local HTML_FILE="/tmp/gopkgcover.html"
  rm -f "${OUT_FILE}" "${HTML_FILE}"
  go test -coverprofile "${OUT_FILE}" $@
  go tool cover "-html=${OUT_FILE}" -o "${HTML_FILE}"
  open "${HTML_FILE}"
}


# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

ulimit -n 524288

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# fnm
FNM_PATH="$HOME/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="$FNM_PATH:$PATH"
  eval "`fnm env`"
fi
