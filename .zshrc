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
zstyle :compinstall filename '/home/ivt/.zshrc'

# syntax highlighting :D
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# i like starship
eval "$(starship init zsh)"

# i also like being able to swipe to go back in firefox
export MOZ_USE_XINPUT2=1

# i dont like netbeans but it is what it is
export PATH="${PATH}:/home/ivt/Programs/netbeans/bin"

# aliases
alias g='git'
