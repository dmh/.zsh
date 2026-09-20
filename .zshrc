#!/usr/bin/env zsh

# === ENVIRONMENT ===
export CLICOLOR=1
typeset -U PATH  # Remove duplicate PATH entries
export BUN_INSTALL="$HOME/.bun"
[[ -d "$BUN_INSTALL" ]] && export PATH="$BUN_INSTALL/bin:$PATH"
export NVM_DIR="$HOME/.nvm"

# === PATH ===
[[ -f "${HOME}/.zsh/.zsh_path_local" ]] && source "${HOME}/.zsh/.zsh_path_local"

# === NVM ===
[[ -s "$NVM_DIR/nvm.sh" ]] && source "$NVM_DIR/nvm.sh"
[[ -s "$NVM_DIR/bash_completion" ]] && source "$NVM_DIR/bash_completion"


# === ALIASES ===
[[ -f "${HOME}/.zsh/.zsh_aliases" ]] && source "${HOME}/.zsh/.zsh_aliases"
[[ -f "${HOME}/.zsh_aliases.local" ]] && source "${HOME}/.zsh_aliases.local"

# === ZSH OPTIONS ===
setopt AUTO_CD              # cd by typing directory name
setopt NO_CASE_GLOB         # Case insensitive globbing
setopt AUTO_MENU            # Menu completion on second tab
setopt ALWAYS_TO_END        # Move cursor to end after completion
setopt COMPLETE_IN_WORD     # Complete from both ends
setopt INTERACTIVE_COMMENTS # Allow comments in interactive shell
setopt PROMPT_SUBST         # Enable prompt substitution

# === HISTORY ===
HISTFILE="${ZDOTDIR:-$HOME}/.zsh_history"
HISTSIZE=10000
SAVEHIST=10000
setopt INC_APPEND_HISTORY     # Add commands as typed
setopt SHARE_HISTORY          # Share between sessions
setopt HIST_IGNORE_SPACE      # Ignore commands starting with space
setopt HIST_FIND_NO_DUPS      # No duplicates in search
setopt HIST_REDUCE_BLANKS     # Remove blank lines
setopt HIST_VERIFY            # Show before executing
setopt HIST_EXPIRE_DUPS_FIRST # Delete duplicates first
setopt EXTENDED_HISTORY       # Add timestamps

# === KEY BINDINGS ===
# Make sure terminal is in application mode when zle is active
if (( ${+terminfo[smkx]} && ${+terminfo[rmkx]} )); then
    zle-line-init() { echoti smkx }
    zle-line-finish() { echoti rmkx }
    zle -N zle-line-init
    zle -N zle-line-finish
fi

# === COMPLETION (Cached for performance) ===
autoload -Uz compinit
if [[ -n ${ZDOTDIR:-$HOME}/.zcompdump(#qN.mh+24) ]]; then
    compinit
else
    compinit -C  # Use cache, skip security check
fi

zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z-_}={A-Za-z_-}' 'r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' list-colors ''

# === PROMPT ===
[[ -f "${HOME}/zsh-prompt/prompt.sh" ]] && source "${HOME}/zsh-prompt/prompt.sh"

[[ -s "$HOME/.bun/_bun" ]] && source "$HOME/.bun/_bun"
# bun completions
[ -s "/Users/dmh/.bun/_bun" ] && source "/Users/dmh/.bun/_bun"
