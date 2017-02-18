# Additional aliases for user

# default bash
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias tmux='tmux -2'
# Stopwatch
alias timer='echo "Timer started. Stop with Ctrl-D." && date && time cat && date'

# Aliases for scripts
SCRIPTS_DIR='/home/marko/local/scripts'

alias touchpad='${SCRIPTS_DIR}/toggle_touchpad.sh'
alias mute='${SCRIPTS_DIR}/mute.sh'
alias toggle_layout='/${SCRIPTS_DIR}/toggle_layout.sh'
alias weather='${SCRIPTS_DIR}/weather.sh'
alias fn='sudo ${SCRIPTS_DIR}/fn_k400.py'

# Useful
alias bat='sudo tlp bat'
alias qq='exit'
alias :q='exit'
alias caps='xdotool key Caps_Lock'
alias CAPS='caps'
alias subs='subliminal download -l en'

alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'

alias myscrot='scrot ~/Pictures/scrot_ss/%Y-%m-%d-%T-screenshot.png'

# APT aliases
alias install='sudo apt-get install'
alias remove='sudo apt-get remove'
