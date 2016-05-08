# System-wide .bashrc file for interactive bash(1) shells.

# To enable the settings / commands in this file for login shells as well,
# this file has to be sourced in /etc/profile.

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, overwrite the one in /etc/profile)
PS1='${debian_chroot:+($debian_chroot)}\u@\h:\W\$ '

# Commented out, don't overwrite xterm -T "title" -n "icontitle" by default.
# If this is an xterm set the title to user@host:dir
#case "$TERM" in
#xterm*|rxvt*)
#    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD}\007"'
#    ;;
#*)
#    ;;
#esac

# enable bash completion in interactive shells
#if ! shopt -oq posix; then
#  if [ -f /usr/share/bash-completion/bash_completion ]; then
#    . /usr/share/bash-completion/bash_completion
#  elif [ -f /etc/bash_completion ]; then
#    . /etc/bash_completion
#  fi
#fi

# sudo hint
if [ ! -e "$HOME/.sudo_as_admin_successful" ] && [ ! -e "$HOME/.hushlogin" ] ; then
    case " $(groups) " in *\ admin\ *)
    if [ -x /usr/bin/sudo ]; then
	cat <<-EOF
	To run a command as administrator (user "root"), use "sudo <command>".
	See "man sudo_root" for details.

	EOF
    fi
    esac
fi

# if the command-not-found package is installed, use it
if [ -x /usr/lib/command-not-found -o -x /usr/share/command-not-found/command-not-found ]; then
	function command_not_found_handle {
	        # check because c-n-f could've been removed in the meantime
                if [ -x /usr/lib/command-not-found ]; then
		   /usr/lib/command-not-found -- "$1"
                   return $?
                elif [ -x /usr/share/command-not-found/command-not-found ]; then
		   /usr/share/command-not-found/command-not-found -- "$1"
                   return $?
		else
		   printf "%s: command not found\n" "$1" >&2
		   return 127
		fi
	}
fi


# System vars
ANT_HOME=/home/marko/local/apache-ant-1.9.3/
JAVA_HOME=/home/marko/local/java/jdk1.8.0_73/
JRE_HOME=/home/marko/local/java/jdk1.8.0_73/jre/
CATALINA_HOME=/home/marko/local/apache-tomcat-7.0.54/
DERBY_INSTALL=/home/marko/local/db-derby-10.10.2.0-bin/
M2_HOME=/home/marko/local/apache-maven-3.2.1/
FINDBUGS_HOME=/home/marko/local/findbugs-3.0.0/
GOROOT=/home/marko/local/go/
GOPATH=$HOME/.go
GOBIN=$HOME/.go/bin
CABAL=$HOME/.cabal/bin
GHC=/opt/ghc/7.10.3/bin


PATH=${PATH}:${ANT_HOME}/bin:${M2_HOME}/bin:${FINDBUGS_HOME}/bin:${GOROOT}/bin:${GOPATH}/bin:${CABAL}:${GHC}:$MPJ_HOME/bin


PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/usr/local/lib/pkgconfig


export MPJ_HOME=/home/marko/local/mpj/
export PKG_CONFIG_PATH
export ANT_HOME
export JAVA_HOME
export JRE_HOME
export M2_HOME
export FINDBUGS_HOME
export CATALINA_HOME
export PATH
export LD_LIBRARY_PATH
export DERBY_INSTAL
export GOROOT
export GOPATH
export GOBIN
