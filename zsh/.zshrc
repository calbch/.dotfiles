# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git tmux zoxide poetry kubectl)

source $ZSH/oh-my-zsh.sh
#fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src

# User configuration
export LANG=en_US.UTF-8
export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_ENV_HINTS=1

# Set n install path - https://github.com/tj/n
export N_PREFIX="$HOME/.n"
export PATH="$N_PREFIX/bin:$PATH"

# Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='nvim'
 else
   export EDITOR='nvim'
 fi

# pnpm
export PNPM_HOME="/Users/cal/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
# pyenv end

# poetry
export PATH="$HOME/.local/bin:$PATH"
# poetry end

# bun
# completions
# [ -s "/Users/cal/.bun/_bun" ] && source "/Users/cal/.bun/_bun"

export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
# bun end

# go 
export GOPATH="$HOME/go"
export PATH="$GOPATH/bin:$PATH"
# go end

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

alias zshconfig="nvim ~/.zshrc"

alias -g ls="exa -F --group-directories-first --color=always --icons"
alias -g la="exa -alF --group-directories-first --color=always --icons"
alias -g ll="exa -lF --group-directories-first"
alias -g lt="exa -aTF --level=2 --group-directories-first --icons --color=always"
alias -g ldot='exa -a | egrep "^\."'
alias -g cat="bat"
alias -g grep="rg"

alias g="git"
alias gp="git push"
alias gpf="git push --force"
alias gpl="g pull"
alias gpls="g pull --recurse-submodules"
alias gst="git stash"
alias gstp="git stash pop"
alias gs="git switch"
alias gsc="git switch -c"
alias gco="git checkout"
alias grb="git rebase"
alias gcan="git commit --amend --no-edit"
alias gprn="git fetch --all --prune && git branch -v | awk '/\[gone\]/ {print $1}' | xargs git branch -D"

alias lg="lazygit"
alias lzd="lazydocker"

alias pn="pnpm"
alias cp="cp -i"
alias mv="mv -i"
alias rm="rm -i"

eval "$(starship init zsh)"
