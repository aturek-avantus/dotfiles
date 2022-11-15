# Save command history across shells
HISTFILE=${ZDOTDIR:-$HOME}/.zsh_history

# share history across multiple zsh sessions
setopt SHARE_HISTORY

# append to history instead of rewriting
setopt APPEND_HISTORY

# Add commands during shell use, not just at exit
setopt INC_APPEND_HISTORY

# Include timestamps with command history
setopt EXTENDED_HISTORY

# Save a lot of old commands
SAVEHIST=5000
HISTSIZE=2000

# do not store duplications
setopt HIST_IGNORE_DUPS

# removes blank lines from history
setopt HIST_REDUCE_BLANKS

# Expand !! _before_ firing it off
setopt HIST_VERIFY
