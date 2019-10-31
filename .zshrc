#alias ls="ls --color=auto"
alias ls="lsd --group-dirs first"
alias grep="grep --color=auto"
alias fgrep="fgrep --color=auto"
alias egrep="egrep --color=auto"
alias pacman="pacman --color=always"
alias scss="scss --no-cache --quiet"
alias vi="vim"
alias scss="sass --no-cache --sourcemap=none"
alias xclip="xclip -selection c"


export VISUAL=vim
export EDITOR="$VISUAL"

export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'

# ------------------------------- ZSH SETTINGS --------------------------------
# ----- options -----
unsetopt NO_BEEP
unsetopt NO_MATCH
setopt AUTO_CD
setopt BEEP
setopt NOMATCH
setopt NOTIFY
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS
setopt HIST_REDUCE_BLANKS
setopt HIST_VERIFY
setopt HIST_BEEP
setopt INTERACTIVE_COMMENTS
setopt MAGIC_EQUAL_SUBST

HISTFILE="$HOME/.zsh_history"
HIST_STAMPS="mm/dd/yyyy"
DISABLE_UPDATE_PROMPT=true
HISTSIZE=5000
SAVEHIST=5000

# ----- keys -----
bindkey '^[[2~' overwrite-mode
bindkey '^[[3~' delete-char
bindkey '^[[H' beginning-of-line
bindkey '^[[F' end-of-line
bindkey '^[[1;5C' forward-word
bindkey '^[[1;5D' backward-word

# ----- promt -----
PS1="%F{red}[%F{yellow}%n%F{green}@%F{blue}%M% :%~ %F{red}]%#%F{white} "

# -------------------------------- POWERLEVEL ---------------------------------

POWERLEVEL9K_MODE="nerdfont-complete"
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_RPROMPT_ON_NEWLINE=true
POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
POWERLEVEL9K="truncate_beginning"
POWERLEVEL9K_TIME_BACKGROUND="black"
POWERLEVEL9K_TIME_FOREGROUND="white"
POWERLEVEL9K_TIME_FORMAT="%D{%I:%M}"
POWERLEVEL9K_STATUS_VERBOSE=false
POWERLEVEL9K_VCS_CLEAN_FOREGROUND="black"
POWERLEVEL9K_VCS_CLEAN_BACKGROUND="green"
POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND="black"
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND="yellow"
POWERLEVEL9K_VCS_MODIFIED_FOREGROUND="white"
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND="black"
POWERLEVEL9K_COMMAND_EXECUTION_TIME_BACKGROUND="black"
POWERLEVEL9K_COMMAND_EXECUTION_TIME_FOREGROUND="blue"
POWERLEVEL9K_FOLDER_ICON=''
POWERLEVEL9K_STATUS_OK_IN_NON_VERBOSE=true
POWERLEVEL9K_STATUS_VERBOSE=false
POWERLEVEL9K_COMMAND_EXECUTION_TIME_THRESHOLD=0
POWERLEVEL9K_VCS_UNTRACKED_ICON='\u25CF'
POWERLEVEL9K_VCS_UNSTAGED_ICON='\u00b1'
POWERLEVEL9K_VCS_INCOMING_CHANGES_ICON='\u2193'
POWERLEVEL9K_VCS_OUTGOING_CHANGES_ICON='\u2191'
POWERLEVEL9K_VCS_COMMIT_ICON='\uf417'
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="%F{blue}\u256D\u2500%f%F{red}\uE0B2%f"
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="%F{blue}\u2570\uf460%f "
POWERLEVEL9K_CUSTOM_OS_ICON="echo   $(whoami) "
POWERLEVEL9K_CUSTOM_OS_ICON_BACKGROUND="red"
POWERLEVEL9K_CUSTOM_OS_ICON_FOREGROUND="white"
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(custom_os_icon ssh root_indicator dir dir_writable vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(command_execution_time status background_jobs time ram)

[[ $(tty) == /dev/pts/* ]] && source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme;

# -------------------------------- FUNCTIONS ---------------------------------
function lazygit() {
	git status .
	git add .
	git commit -m "$1"
	git push origin HEAD
}

# ----------------------------------- MISC -----------------------------------
xprop -root -remove _ICC_PROFILE # Fix eog washed colors

# Gnome terminal Flat-Remix color-scheme
dconf write /org/gnome/terminal/legacy/profiles:/:b1dcc9dd-5262-4d8d-a863-c897e6d979b9/palette "['#272934', '#d41919', '#5EBDAB', '#FEA44C', '#357AF0', '#BF2E5D', '#49AEE6', '#FFFFFF', '#272934', '#d41919', '#5EBDAB', '#FEA44C', '#357AF0', '#BF2E5D', '#49AEE6', '#FFFFFF']"
