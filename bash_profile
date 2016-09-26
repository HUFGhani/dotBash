########### WHICH OS ###################
case $( uname -s ) in
Linux)
    OS="LINUX"
		gnome-screensaver
    ;;
Darwin)
    OS="MAC"
    ;;
esac

########### Vim #########################

export VISUAL=vim
export EDITOR=vim

########### Environment Setting  #########
#export JAVA_HOME="$(/usr/libexec/java_home)"

function setjdk() {
  if [ $# -ne 0 ]; then
   removeFromPath '/System/Library/Frameworks/JavaVM.framework/Home/bin'
   if [ -n "${JAVA_HOME+x}" ]; then
    removeFromPath $JAVA_HOME
   fi
   export JAVA_HOME=`/usr/libexec/java_home -v $@`
   export PATH=$JAVA_HOME/bin:$PATH
  fi
 }
 function removeFromPath() {
  export PATH=$(echo $PATH | sed -E -e "s;:$1;;" -e "s;$1:?;;")
 }

 function javaV() {
   java -version
 }

 #cleanupDS:  Recursively delete .DS_Store files
 alias cleanupDS="find . -type f -name '*.DS_Store' -ls -delete"

 #finderShowHidden:   Show hidden files in Finder
 alias finderShowHidden='defaults write com.apple.finder ShowAllFiles TRUE'

 #finderHideHidden:   Hide hidden files in Finder
 alias finderHideHidden='defaults write com.apple.finder ShowAllFiles FALSE'

 #lock
if [ $OS == MAC ]; then
   alias lock='/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend'
 elif [ $OS == LINUX ]; then
   alias lock='gnome-screensaver-command -l'
fi

#shutdown
if [ $OS == MAC ]; then
  alias shutdown='sudo shutdown -r now'
elif [ $OS == LINUX ]; then
  alias shutdown='sudo shutdown -h now'
fi

 #reload termianl shell
 alias reload='source ~/.bash_profile'

# SHELL SETTINGS
export HISTSIZE=10000
export HISTFILESIZE=10000
export HISTCONTROL=ignoredups


########### Terminal color ##############
if [[ $COLORTERM = gnome-* && $TERM = xterm ]] && infocmp gnome-256color >/dev/null 2>&1; then
	export TERM=gnome-256color
elif infocmp xterm-256color >/dev/null 2>&1; then
	export TERM=xterm-256color
fi

export CLICOLOR=1
if [ $OS == MAC ]; then
export LSCOLORS=CxfxgxdxBxegfdchagacad
elif [ $OS == LINUX ]; then
export LS_COLORS=di=1;32:ln=35:so=36:pi=33:ex=1;31:bd=34;46:cd=35;43:su=32;47:sg=30;46:tw=30;42:ow=30;43
fi

# Custom bash prompt via kirsle.net/wizards/ps1.html
#export PS1="\[$(tput setaf 3)\]\[$(tput bold)\]\[$(tput setaf 3)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 4)\]\h \[$(tput setaf 5)\]\w\[$(tput setaf 1)\]\[$(tput bold)\]\[$(tput setaf 2)\]\$(__git_ps1)\[$(tput setaf 7)\]\n-->\[$(tput setaf 3)\]"

export PS1="\[$(tput bold)\]\[$(tput setaf 3)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 4)\]\h \[$(tput setaf 5)\]\w\[$(tput setaf 1)\]\[$(tput bold)\]\[$(tput setaf 2)\]\$(__git_ps1)\[$(tput setaf 7)\]\n\[$(tput setaf 6)\]\d \t\[$(tput setaf 7)\]\n-->\[$(tput setaf 3)\]"
export SUDO_PS1="\[$(tput bold)\]\[$(tput setaf 2)\]\u@\h\w\n[\d \t]  ===>\[$(tput sgr0)\]"

export PS2="#++> "


############# SSH ###################
alias pi='ssh pi@192.168.0.19'

alias home='ssh pi@raspberrypi2014.x64.me'

alias sbox='ssh -p2222 hamza@sandbox.dev'

########### git ######################
if [ $OS == MAC ];then
   if [ -f $(brew --prefix)/etc/bash_completion ]; then
      . $(brew --prefix)/etc/bash_completion
   fi
fi

source ~/.bash/git-prompt.sh

########## Aliases ###################

# Shell Aliases

# Unzipping *everything*
function extract () {
     if [ -f $1 ] ; then
         case $1 in
             *.tar.bz2)   tar xjf $1        ;;
             *.tar.gz)    tar xzf $1     ;;
             *.bz2)       bunzip2 $1       ;;
             *.rar)       rar x $1     ;;
             *.gz)        gunzip $1     ;;
             *.tar)       tar xf $1        ;;
             *.tbz2)      tar xjf $1      ;;
             *.tgz)       tar xzf $1       ;;
             *.zip)       unzip $1     ;;
             *.Z)         uncompress $1  ;;
             *.7z)        7z x $1    ;;
             *)           echo "'$1' cannot be extracted via extract()" ;;
         esac
     else
         echo "'$1' is not a valid file"
     fi
}
######### Directory Aliases #########
alias down="cd ~/Downloads";
alias desk="cd ~/Desktop"
alias ~="cd ~"
alias .1="cd .."
alias .2="cd ../../"
alias .3="cd ../../../"
alias .4="cd ../../../../"
alias .5="cd ../../../../../"

######### Iterm2 shell intergration ####
test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
