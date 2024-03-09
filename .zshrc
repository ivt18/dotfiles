HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=5000
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt incappendhistory
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups
unsetopt autocd beep extendedglob nomatch notify

# emacs bindings because i find vi bindings annoying in this case
bindkey -e

# case insensitive completion
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# syntax highlighting :D
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# i like starship
eval "$(starship init zsh)"

# i also like being able to swipe to go back in firefox
export MOZ_USE_XINPUT2=1

# i like neovim
export EDITOR=nvim

# aliases
alias g='git'
alias vim='nvim'
