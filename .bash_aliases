# Additional aliases for user

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

# APT aliases
alias install='sudo apt-get install'
alias remove='sudo apt-get remove'
