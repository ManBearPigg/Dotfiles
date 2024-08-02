#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return


## Use the up and down arrow keys for finding a command in history (you can write some initial letters of the command first).
bind '"\e[A":history-search-backward'
bind '"\e[B":history-search-forward'


# PS1
RED="\[\e[31m\]"
GREEN="\[\e[32m\]"
YELLOW="\[\e[33m\]"
RESET="\[\e[0m\]"
get_last_directory() {
    local current_path="$PWD"
    local last_dir
    last_dir=$(basename "$current_path")
    if [ "$last_dir" = "$USER" ]; then
        echo "~"
    else
        echo "$last_dir"
    fi
}
PS1="${GREEN}sammy ${RED}💩${YELLOW}\$(get_last_directory) ${RESET}> "


# Encrypt
function encrypt() {
  openssl enc -e -aes-256-cbc -pbkdf2 -iter 100000 -salt -in $1 -out $2
}


# Decrypt
function decrypt() {
  openssl enc -d -aes-256-cbc -pbkdf2 -iter 100000 -salt -in $1 -out $2 
}

# Alias
alias ls='ls --color=auto'
alias la='ls -a'
alias clip='xclip -sel clip <'
alias lwormhole='wormhole --transit-helper tcp:192.168.0.28:4001'
alias tmux='tmux -u' # emojis work
