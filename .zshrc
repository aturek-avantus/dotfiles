# ----------
# zsh
# ----------

# Don't replace * with its values, but show them below
setopt GLOB_COMPLETE

# If you write a directory (relative/absolute) but forget 'cd',
# add the command and go there
setopt AUTO_CD

# ZSH HISTORY
. $ZDOTDIR/zsh/history.sh

# ZSH SPELL CORRECTION
. $ZDOTDIR/zsh/correction.sh

# ZSH AUTO COMPLETE
. $ZDOTDIR/zsh/completion.sh

# ZSH PROMPT
. $ZDOTDIR/zsh/prompt.sh

# Colors plz
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# Aliases
. $ZDOTDIR/generic/aliases.sh

# Pull in homebrew
. $ZDOTDIR/shellsetup/homebrew.sh
