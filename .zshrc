# nvm setup
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

if [ -f "$HOME"/.zsh/.zsh_aliases ]; then
    source "$HOME"/.zsh/.zsh_aliases
fi

if [ -f "$HOME"/.zsh_aliases.local ]; then
    source "$HOME"/.zsh_aliases.local
fi

# enable colors
export CLICOLOR=1

# ZSH Options
# http://zsh.sourceforge.net/Doc/Release/Options.html#Options
setopt AUTO_CD
setopt NO_CASE_GLOB # Case Insensitive Globbing
setopt AUTO_MENU # use menu completion after the second consecutive request for completion
setopt ALWAYS_TO_END
setopt COMPLETE_IN_WORD
setopt INTERACTIVE_COMMENTS # Allow comments even in interactive shells.
setopt PROMPT_SUBST

# ============================================================
# borrowed on oh_my_zsh
# make key bindings work properly
# Make sure that the terminal is in application mode when zle is active, since
# only then values from $terminfo are valid
if (( ${+terminfo[smkx]} )) && (( ${+terminfo[rmkx]} )); then
    function zle-line-init {
        echoti smkx
    }
    function zle-line-finish {
        echoti rmkx
    }
    zle -N zle-line-init
    zle -N zle-line-finish
fi
# ============================================================


# ====================================
# HISTORY
#
# ctrl-R to serch in history
#
# Save command history
HISTFILE="$ZDOTDIR/.zsh_history"
HISTSIZE=2000
SAVEHIST=1000
setopt INC_APPEND_HISTORY # adds commands as they are typed, not at shell exit
setopt HIST_FIND_NO_DUPS # ignore duplicates when searching
setopt HIST_REDUCE_BLANKS # removes blank lines from history

setopt HIST_VERIFY # show command with history expansion to user before running it
setopt HIST_EXPIRE_DUPS_FIRST # delete duplicates first when HISTFILE size exceeds HISTSIZE
# ====================================

# autoload -U compinit; compinit
autoload -Uz compaudit compinit

# shows completion suggests in a menu
zstyle ':completion:*:*:*:*:*' menu select

# case insensitive (all), partial-word and substring completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z-_}={A-Za-z_-}' 'r:|=*' 'l:|=* r:|=*'

zstyle ':completion:*' list-colors ''

compaudit
compinit -i

# edd custom prompt
source "$HOME"/zsh-prompt/prompt.sh

# bun completions
[ -s "/Users/dmh/.bun/_bun" ] && source "/Users/dmh/.bun/_bun"
# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
