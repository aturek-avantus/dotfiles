BREW_PATH=/usr/local/bin

GNU_PATH=/usr/local/opt/coreutils/libexec/gnubin
GNU_PATH=$GNU_PATH:/usr/local/opt/gnu-sed/libexec/gnubin
GNU_PATH=$GNU_PATH:/usr/local/opt/gnu-tar/libexec/gnubin
GNU_PATH=$GNU_PATH:/usr/local/opt/grep/bin

OPENSSL_PATH=/usr/local/Cellar/openssl/1.0.1g/bin
SVN_PATH=/usr/local/Cellar/subversion/1.8.8/bin

PATH=$BREW_PATH:$GNU_PATH:$OPENSSL_PATH:$SVN_PATH:$PATH:~/bin:./node_modules/.bin:.bin

# PATH=/usr/local/bin:$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
# PATH=./env/bin:$PATH # If there's a virtualenv, use that for python

GNU_MANPATH=/usr/local/opt/coreutils/libexec/gnuman
GNU_MANPATH=$GNU_MANPATH:/usr/local/opt/gnu-sed/libexec/gnuman
GNU_MANPATH=$GNU_MANPATH:/usr/local/opt/gnu-tar/libexec/gnuman

OPENSSL_MANPATH=/usr/local/Cellar/openssl/1.0.1g/share/man

MANPATH=$GNU_MANPATH:$OPENSSL_MANPATH:$MANPATH

# copied from http://unix.stackexchange.com/questions/148/colorizing-your-terminal-and-shell-environment
export TERM=xterm-color
export GREP_OPTIONS='--color=auto' GREP_COLOR='1;32'
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# this is here for GNU ls (the other is for BSD ls)
# export LS_COLORS="di=36;40:ln=35;40:so=32;40:pi=33;40:ex=31;40:bd=34;46:cd=34;43:su=0;41:sg=0;46:tw=0;42:ow=0;43:"

# BSD ls
# export LS_COLORS=$LSCOLORS
# export LS_OPTIONS='--color=auto'

# Unescaped
# export PS1='\e[0;32m\u\e[0m@\e[0;34m\H \e[0;36m\w> \e[0m'
export PS1='\[\e[0;32m\]\u\[\e[0m\]@\[\e[0;34m\]\H \[\e[0;36m\]\w> \[\e[0m\]'

function filesindirs() {
  for folder in `ls` ; do
    if [[ -d $folder ]] ; then
      echo $folder: `find $folder -type f | wc | sed 's/ \{2,\}/ /g' | cut -d ' ' -f 2`;
    fi
  done;
}

alias git=hub
alias fileslike="find * -type f | grep";
alias fileswith="find * -type f -print0 | xargs -0 grep -l";
alias gitst="git status";
alias gitdiff="git diff HEAD";
alias web="open -a Google\ Chrome";
alias xdg-open="open";

source ~/.git-completion.bash

alias ls="ls --color=auto" # this is for GNU ls
alias grep="grep --color=auto" # this is for GNU grep

# Set iterm window title to PWD
export PROMPT_COMMAND='echo -ne "\033]0;${PWD/#$HOME/~}\007"'

# Set iterm window by calling `title foo bar`
#function title {
#    echo -ne "\033]0;"$*"\007"
#}

# Boot2docker/docker
export BOOT2DOCKER_IP=$(boot2docker ip 2>/dev/null)

clean_docker_containers ()
{
  for container in `docker ps -a -q` ;
  do
    docker rm $container ;
  done;
}

clean_docker_images ()
{
  for image in `docker images -a -q` ;
  do
    docker rmi $image;
  done;
}

# Go
export GOPATH=$HOME/go

# Ruby
if [ `which rbenv` ] ; then
  eval "$(rbenv init -)"
  alias be='bundle exec'
  alias bers='bundle exec rails server'
  alias binstall='bundle install --binstubs .bin --path .bundle'
  PATH=$PATH:.bin
fi

# Node (NVM)
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh
