# zinit installation
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
if [ ! -d "$ZINIT_HOME" ]; then
  mkdir -p "$(dirname $ZINIT_HOME)"
  git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

source "${ZINIT_HOME}/zinit.zsh"

alias mydocker='docker build -t mydocker . && docker run --cap-add="SYS_ADMIN" mydocker'

export TEMPL_EXPERIMENT=rawgo

# compiler stuff
export JAVA_HOME=/opt/jdk-21/Contents/Home
export PATH=$JAVA_HOME/bin:$PATH
export ANTLR_INS="/Users/jackparsons/antlr/antlr4-install"
export ANTLR_JAR="/Users/jackparsons/antlr/antlr4-install/bin/antlr-4.13.1-complete.jar"
export CLASSPATH="/Users/jackparsons/antlr/antlr4-install/bin/antlr-4.13.1-complete.jar:"
alias antlr4="java -Xmx500M org.antlr.v4.Tool"
alias grun="java org.antlr.v4.gui.TestRig"
export MLIR_INS="/Users/jackparsons/llvm-project/build"
export MLIR_DIR="/Users/jackparsons/llvm-project/build/lib/cmake/mlir"
export PATH="/Users/jackparsons/llvm-project/build/bin:$PATH"
export PATH="/Users/jackparsons/Tester/bin/:$PATH"

# golang
export PATH=$HOME/.local/bin:/usr/local/bin:$PATH
export PATH=${PATH}:`go env GOPATH`/bin
export PATH=$PATH:$GOPATH/bin

export CPLUS_INCLUDE_PATH=$CPLUS_INCLUDE_PATH:/opt/local/include:~/MyLib:

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
export GPG_TTY=$(tty)

export FZF_DEFAULT_OPTS="--preview 'ls --color'"
export FZF_DEFAULT_OPTS='--color=bg+:#2f334d,bg:#222436,spinner:#82aaff,hl:#545c7e,fg:#c8d3f5,header:#545c7e,info:#82aaff,pointer:#82aaff,marker:#82aaff,fg+:#c8d3f5,prompt:#82aaff,hl+:#82aaff'
# export FZF_DEFAULT_OPTS='--color=bg+:#3B4252,bg:#2E3440,spinner:#81A1C1,hl:#616E88,fg:#D8DEE9,header:#616E88,info:#81A1C1,pointer:#81A1C1,marker:#81A1C1,fg+:#D8DEE9,prompt:#81A1C1,hl+:#81A1C1'

zinit ice as"command" from"gh-r" \
          atclone"./starship init zsh > init.zsh; ./starship completions zsh > _starship" \
          atpull"%atclone" src"init.zsh"
zinit light starship/starship

zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

zinit snippet OMZP::git

# load competions
autoload -U compinit && compinit

zinit cdreplay -q

bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# aliases
alias repos="cd /Users/jackparsons/Storage/Repositories"
alias vi='nvim'
alias p='tmux attach-session -t "$(tmux ls | fzf | awk '\''{print $1}'\'')"'
alias np='if [ -n "$TMUX" ]; then tmux kill-session -t $(tmux display-message -p "#S"); fi; selected_directory=$(find . -maxdepth 1 -type d | grep -v -e '.git' | fzf --preview "ls --color -l {}"); if [ -n "$selected_directory" ]; then tmux new-session -c "$selected_directory" -s "$(basename "$selected_directory")"; fi'
alias ls='ls --color'
alias k='kubectl'
new-repo () {
  cd /Users/jackparsons/Storage/Repositories
  gh repo create ${1} --${2} --clone
  cd ${1}
}



# history
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# allow lower case matching
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu-no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'

eval "$(fzf --zsh)"
eval "$(/opt/homebrew/bin/brew shellenv)"

fpath=(/Users/jackparsons/.docker/completions $fpath)
autoload -Uz compinit
compinit
