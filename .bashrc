# copied from http://unix.stackexchange.com/questions/148/colorizing-your-terminal-and-shell-environment
export TERM=xterm-color
# export GREP_OPTIONS='--color=auto' GREP_COLOR='1;32'
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

export PS1="\[\e[1;32m\]\u\[\e[0m\]@\[\e[1;34m\]\H \[\e[1;93m\]\[\\@\] \[\e[1;36m\]\w> \[\e[0m\]"

function filesindirs() {
  for folder in `ls` ; do
    if [[ -d $folder ]] ; then
      echo $folder: `find $folder -type f | wc | sed 's/ \{2,\}/ /g' | cut -d ' ' -f 2`;
    fi
  done;
}

alias fileslike="find * -type f | grep";
alias fileswith="find * -type f -print0 | xargs -0 grep -l";
alias gitst="git status";
alias gitdiff="git diff HEAD";

source ~/.git-completion.bash

alias ls="ls --color=auto" # this is for GNU ls
alias grep="grep --color=auto" # this is for GNU grep

# Set iterm window title to PWD
export PROMPT_COMMAND='echo -ne "\033]0;${PWD/#$HOME/~}\007"'

git_done() {
  MAIN_BRANCH=${1:-main}
  git remote update --prune \
    && git co $MAIN_BRANCH \
    && git pull \
    && git branch --merged \
    | grep -v -E "\\*|$MAIN_BRANCH" \
    | xargs -n 1 git branch -d

  echo "done"
}


export AWS_DEFAULT_REGION=us-east-1
