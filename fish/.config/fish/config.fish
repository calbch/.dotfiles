if status is-interactive
    # Commands to run in interactive sessions can go here
end

set fish_greeting

# pnpm
set -gx PNPM_HOME "Users/cal/Library/pnpm"
set -gx PATH "$PNPM_HOME" $PATH
# pnpm end

# pyenv
pyenv init - | source

set -gx EDITOR nvim
set -gx VISUAL nvim

# editors
alias vim='nvim'
alias vi="nvim"

# exa
alias ls='exa -aF --group-directories-first --color=always --icons'
alias la='exa -alF --group-directories-first --color=always --icons'
alias ll='exa -lF --group-directories-first'
alias lt='exa -aTF --level=2 --group-directories-first --icons --color=always'
alias ldot='exa -a | egrep "^\."'

# GIT
alias g='git'
alias lg='lazygit'

# no more overwriting sadgeness
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

starship init fish | source

# Created by `pipx` on 2022-10-15 12:41:12
set PATH $PATH /Users/cal/.local/bin

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH
