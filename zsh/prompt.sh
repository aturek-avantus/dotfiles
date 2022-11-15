# Set up git info
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
RPROMPT=\$vcs_info_msg_0_
zstyle ':vcs_info:git:*' formats '%F{11}(%b) %F{214}%r%f'
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git:*' check-for-changes

# Actual prompt
PROMPT="%B%F{82}%n%f%b @ %B%F{39}%m%f%b %F{51}%~%f%F{51}> %f"
