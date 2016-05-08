# Additional aliases for user

# Stopwatch
alias timer='echo "Timer started. Stop with Ctrl-D." && date && time cat && date'


# Tomcat aliases
alias tomcatStop='sudo ${CATALINA_HOME}/bin/shutdown.sh'
alias tomcatStart='sudo ${CATALINA_HOME}/bin/startup.sh'

# DerbyDB aliases, dummy login
alias derbyStart='java -Dderby.system.home=/home/marko/Documents/derby-baze -jar $DERBY_INSTALL/lib/derbyrun.jar server start'
alias derbyStop='java -Dderby.system.home=/home/marko/Documents/derby-baze -jar $DERBY_INSTALL/lib/derbyrun.jar server shutdown -user sa -password java'
alias derbyIJ='java -jar $DERBY_INSTALL/lib/derbyrun.jar ij'


# Aliases for scripts
alias touchpad='/home/marko/local/scripts/ToggleTouchpad.sh'
alias mute='/home/marko/local/scripts/mute.sh'
alias toggle_layout='/home/marko/local/scripts/toggle_layout.sh'
alias weather='/home/marko/local/scripts/weather.sh'

# Useful
alias bat='sudo tlp bat'
alias clock='tty-clock -cC 4 '
alias qq='exit'
alias :q='exit'

# APT aliases
alias install='sudo apt-get install'
alias remove='sudo apt-get remove'

alias sdown='sudo shutdown -P now'


# Python3 env switch
alias py3env='sudo -s source  /home/marko/local/py3_env/bin/activate'

