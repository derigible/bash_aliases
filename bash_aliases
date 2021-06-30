# get the directory that the bash_aliases file lives in
SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )"

######## Aliases #######

### Color improvements for shell
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
export PS1="\\[\033[33;1m\]\w\[\033[32;1m\]\$(__git_ps1 ' [%s]')\[\033[m\]-> "

### Change the prompt message based on sshed or not
alias sshed='export PS1="\[\033[36m\]\h:\[\033[33;1m\]\w\[\033[m\]-> "'
alias locsh='export PS1="\[\033[33;1m\]\w\[\033[m\]-> "'

### Display different types of aliases
alias cgit='cat $DIR/git_aliases'
alias cruby='cat $DIR/ruby_aliases'
alias cdock='cat $DIR/docker_aliases'
alias cprof='cat ~/.bashrc'
alias calias="cat $DIR/bash_aliases; cgit; cruby; cdock; cprof;"

### Common bash commands with modifiers
alias ll='ls -Glah'

### Miscellaneous commands
alias reload='. ~/.bashrc'

### Git Methods ###

. $DIR/git_aliases


### Rails/Ruby Methods ###

. $DIR/ruby_aliases


### Docker Methods ###

. $DIR/docker_aliases

### CLI Shortcuts ###

alias kc='kubectl'

### SCRIPT VARS ###
GIT_PS1_SHOWDIRTYSTATE=1