#-------------------------------------------------------------
# Custom .bash_profile
#-------------------------------------------------------------

# If not running interactively, don't do anything
[ -z "$PS1" ] && return


#-------------------------------------------------------------
# Global Variables
#-------------------------------------------------------------

# Do echo after each command
export PROMPT_COMMAND=''

# Editor
export VISUAL=nano
export EDITOR="$VISUAL"

# Path
export PATH=/usr/bin:/bin:/usr/sbin:/sbin
export PATH=/usr/local/bin:/usr/local/sbin:$PATH
export PATH=~/bin:$PATH


#-------------------------------------------------------------
# Text and colors
#-------------------------------------------------------------

# Shell colors
export TERM=xterm-color
export CLICOLOR=1
#export LS_COLORS='rs=0:di=01;34:ln=01;36:mh=00:pi=40;33'
export LS_COLORS='GxFxCxDxBxegedabagaced'

# Colors
export White='\e[1;37m'
export Black='\e[0;30m'
export Blue='\e[0;34m'
export Green='\e[0;32m'
export Cyan='\e[0;36m'
export Red='\e[0;31m'
export Purple='\e[0;35m'
export Brown='\e[0;33m'
export Yellow='\e[1;33m'
export Grey='\e[0;30m'

# Light colors
export LGreen='\e[1;32m'
export LCyan='\e[1;36m'
export LRed='\e[1;31m'
export LPurple='\e[1;35m'
export LGrey='\e[1;30m'
export LBlue='\e[1;34m'

# Reset
export NC='\e[39m' # No Color

# LESS man page colors (makes Man pages more readable).
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'



#-------------------------------------------------------------
# Alias
#-------------------------------------------------------------

# Custom aliases
alias l='ls -AF'		# Sort by hidden files and show info
alias ll='ls -AFg'		# Sort by hidden file
alias lk='ls -AFgSr'	# Sort by size, biggest last.
alias lt='ls -AFgtr'	# Sort by date, most recent last.
alias lc='ls -ltcr'		# Sort by/show change time,most recent last.
alias lu='ls -ltur'		# Sort by/show access time,most recent last.
alias lr='ls -RAl'		# Recursive ls show hidden files and info

if [ -x "$(command -v lsd)" ]; then
  alias ls='lsd -l'
fi

alias cp='cp -v'		# Copy vebose mode
alias cpr='cp -v -r'	# Copy a directory verbose
alias mv='mv -v -f'		# Move vebose
alias rm='rm -v -f'     # Remove verbose without asking
alias rmr='rm -v -r -f'	# Remove directory verbose

cd() { builtin cd "$@"; ls; }               # Always list directory contents upon 'cd'
alias cd..='cd ../'                         # Go back 1 directory level (for fast typers)
alias ..='cd ../'                           # Go back 1 directory level
alias ...='cd ../../'                       # Go back 2 directory levels
alias .3='cd ../../../'                     # Go back 3 directory levels
alias .4='cd ../../../../'                  # Go back 4 directory levels
alias .5='cd ../../../../../'               # Go back 5 directory levels
alias .6='cd ../../../../../../'            # Go back 6 directory levels

alias c='clear'         # Clear the screen

alias f='open -a Finder ./'                 # f:            Opens current directory in MacOS Finder

alias root='sudo -i'    # Root shell

zipf () { zip -r "$1".zip "$1" ; }          # zipf:         To create a ZIP archive of a folder
alias numFiles='echo $(ls -1 | wc -l)'      # numFiles:     Count of non-hidden files in current dir
alias make1mb='mkfile 1m ./1MB.dat'         # make1mb:      Creates a file of 1mb size (all zeros)
alias make5mb='mkfile 5m ./5MB.dat'         # make5mb:      Creates a file of 5mb size (all zeros)
alias make10mb='mkfile 10m ./10MB.dat'      # make10mb:     Creates a file of 10mb size (all zeros)


alias memHogsTop='top -l 1 -o rsize | head -20'
alias memHogsPs='ps wwaxm -o pid,stat,vsize,rss,time,command | head -10'

alias netCons='lsof -i'                             # netCons:      Show all open TCP/IP sockets
alias flushDNS='dscacheutil -flushcache'            # flushDNS:     Flush out the DNS Cache
alias lsock='sudo /usr/sbin/lsof -i -P'             # lsock:        Display open sockets
alias lsockU='sudo /usr/sbin/lsof -nP | grep UDP'   # lsockU:       Display only open UDP sockets
alias lsockT='sudo /usr/sbin/lsof -nP | grep TCP'   # lsockT:       Display only open TCP sockets
alias ipInfo0='ifconfig getpacket en0'              # ipInfo0:      Get info on connections for en0
alias ipInfo1='ifconfig getpacket en1'              # ipInfo1:      Get info on connections for en1
alias openPorts='sudo lsof -i | grep LISTEN'        # openPorts:    All listening connections
alias showBlocked='sudo ipfw list'                  # showBlocked:  All ipfw rules inc/ blocked IPs

alias apacheRestart='service apache2 restart'           # apacheRestart:    Restart Apache
alias editHosts='sudo nano /etc/hosts'                  # editHosts:        Edit /etc/hosts file

alias reload="source ~/.bash_profile"

alias preview="fzf --preview 'bat --color \"always\" {}'"

alias pping="~/.prettyping"

#-------------------------------------------------------------
# Functions
#-------------------------------------------------------------

# Find a file with a pattern in name
function ff() { find . -type f -iname '*'"$*"'*' -ls ; }


# Creates an archive (*.tar.gz) from given directory.
function maketar() { tar cvzf "${1%%/}.tar.gz"  "${1%%/}/"; }


# Create a ZIP archive of a file or folder.
function makezip() { zip -r "${1%%/}.zip" "$1" ; }


# Make your directories and files access rights sane.
function sanitize() { chmod -R u=rwX,g=rX,o= "$@" ;}


# When Sudo won't find the binary
function mydo()
{
	echo Executing sudo with: "$1" "${@:2}"
	sudo $(which $1) "${@:2}"
}


# Function to run upon exit of shell.
function _exit()
{
    sleep 1
}
trap _exit EXIT


# Update bash_profile
function refresh()
{
    clear
    printf "\n$Green Profile updated.\n"
    source $HOME/.bash_profile
    rm $HOME/.bash_profile~ > /dev/null 2>&1
}


# Calculates the gzip compression of a file
function gzipsize(){
	 echo $((`gzip -c $1 | wc -c`/1024))"KB"
}

function sshKeyGen(){
    echo "What's the name of the Key (no spaced please) ? ";
    read name;
    echo "What's the email associated with it? ";
    read email;
    `ssh-keygen -t rsa -f ~/.ssh/id_rsa_$name -C "$email"`;
    ssh-add ~/.ssh/id_rsa_$name
    pbcopy < ~/.ssh/id_rsa_$name.pub;
    echo "SSH Key copied in your clipboard";
}


# rename all the files which contain uppercase letters to lowercase in the current folder
function filestolower(){
  read -p "This will rename all the files and directories to lowercase in the current folder, continue? [y/n]: " letsdothis
  if [ "$letsdothis" = "y" ] || [ "$letsdothis" = "Y" ]; then
    for x in `ls`
      do
      skip=false
      if [ -d $x ]; then
	read -p "'$x' is a folder, rename it? [y/n]: " renamedir
	if [ "$renamedir" = "n" ] || [ "$renameDir" = "N" ]; then
	  skip=true
	fi
      fi
      if [ "$skip" == "false" ]; then
        lc=`echo $x  | tr '[A-Z]' '[a-z]'`
        if [ $lc != $x ]; then
          echo "renaming $x -> $lc"
          mv $x $lc
        fi
      fi
    done
  fi
}


# Create standard .sh file
function msh()
{
    if [ "$1" ]; then
        if [ ! -f "$1.sh" ]; then
            printf "${Green}Creating ${NC}$1\n"
            echo "#!/usr/local/bin/bash" > $1
            echo "# " >> $1
            chmod +x $1
            nano $1
        else
            printf "${Green}File already exist.\n"
        fi
    else
        printf "${Green}Give me a filename.\n"
    fi
}

ii() {
    echo -e "\nYou are logged on ${RED}$HOST"
    echo -e "\nAdditionnal information:$NC " ; uname -a
    echo -e "\n${RED}Users logged on:$NC " ; w -h
    echo -e "\n${RED}Current date :$NC " ; date
    echo -e "\n${RED}Machine stats :$NC " ; uptime
    echo -e "\n${RED}Current network location :$NC " ; scselect
    echo -e "\n${RED}Public facing IP Address :$NC " ;myip
    #echo -e "\n${RED}DNS Configuration:$NC " ; scutil --dns
    echo
}

#   extract:  Extract most know archives with one command
#   ---------------------------------------------------------
    extract () {
        if [ -f $1 ] ; then
          case $1 in
            *.tar.bz2)   tar xjf $1     ;;
            *.tar.gz)    tar xzf $1     ;;
            *.bz2)       bunzip2 $1     ;;
            *.rar)       unrar e $1     ;;
            *.gz)        gunzip $1      ;;
            *.tar)       tar xf $1      ;;
            *.tbz2)      tar xjf $1     ;;
            *.tgz)       tar xzf $1     ;;
            *.zip)       unzip $1       ;;
            *.Z)         uncompress $1  ;;
            *.7z)        7z x $1        ;;
            *)     echo "'$1' cannot be extracted via extract()" ;;
             esac
         else
             echo "'$1' is not a valid file"
         fi
    }

alias qfind="find . -name "                 # qfind:    Quickly search for file
ff () { /usr/bin/find . -name "$@" ; }      # ff:       Find file under the current directory
ffs () { /usr/bin/find . -name "$@"'*' ; }  # ffs:      Find file whose name starts with a given string
ffe () { /usr/bin/find . -name '*'"$@" ; }  # ffe:      Find file whose name ends with a given string


# get current status of git repo
function parse_git_branch() {
        BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
        if [ ! "${BRANCH}" == "" ]
        then
				STAT=`parse_git_dirty`
                echo " [${BRANCH}${STAT}]"
        else
                echo ""
        fi
}

function parse_git_dirty {
	status=`git status 2>&1 | tee`
	dirty=`echo -n "${status}" 2> /dev/null | grep "modified:" &> /dev/null; echo "$?"`
	untracked=`echo -n "${status}" 2> /dev/null | grep "Untracked files" &> /dev/null; echo "$?"`
	ahead=`echo -n "${status}" 2> /dev/null | grep "Your branch is ahead of" &> /dev/null; echo "$?"`
	newfile=`echo -n "${status}" 2> /dev/null | grep "new file:" &> /dev/null; echo "$?"`
	renamed=`echo -n "${status}" 2> /dev/null | grep "renamed:" &> /dev/null; echo "$?"`
	deleted=`echo -n "${status}" 2> /dev/null | grep "deleted:" &> /dev/null; echo "$?"`
	bits=''
	if [ "${renamed}" == "0" ]; then
		bits=">${bits}"
	fi
	if [ "${ahead}" == "0" ]; then
		bits="*${bits}"
	fi
	if [ "${newfile}" == "0" ]; then
		bits="+${bits}"
	fi
	if [ "${untracked}" == "0" ]; then
		bits="?${bits}"
	fi
	if [ "${deleted}" == "0" ]; then
		bits="x${bits}"
	fi
	if [ "${dirty}" == "0" ]; then
		bits="!${bits}"
	fi
	if [ ! "${bits}" == "" ]; then
		echo " ${bits}"
	else
		echo ""
	fi
}


#-------------------------------------------------------------
# Greetings
#-------------------------------------------------------------

# Title bar black
echo -n -e "\033]6;;bg;black;brightness;100\a"
TITLEBAR='\[\033]0;[\u] - [${SHELL} - \V]\007\]'


#-------------------------------------------------------------
# Prompt
#-------------------------------------------------------------

export PS1="\[\e[33m\] \u\[\e[m\]\[\e[33m\]@\[\e[33m\]\h\[\e[m\]  \[\e[32m\] \W\[\e[m\]\[\e[33m\]\`parse_git_branch\`\[\e[m\]  "

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/John/Downloads/google-cloud-sdk/path.bash.inc' ]; then . '/Users/John/Downloads/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/John/Downloads/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/John/Downloads/google-cloud-sdk/completion.bash.inc'; fi

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# Setting PATH for Python 3.7
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.7/bin:${PATH}"
export PATH

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
