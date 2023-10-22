export PATH=$HOME/.local/bin:/usr/local/bin:$PATH
export PATH=${PATH}:`go env GOPATH`/bin

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export CPLUS_INCLUDE_PATH=$CPLUS_INCLUDE_PATH:/opt/local/include:~/MyLib:
export FZF_DEFAULT_OPTS="--preview 'cat {}'"

# CMPUT 415
export ANTLR_INS="/Users/jackparsons/antlr/antlr4-install"
export ANTLR_JAR="/Users/jackparsons/antlr/antlr4/antlr4-install/bin/antlr-4.13.0-complete.jar"
export CLASSPATH="$ANTLR_JAR:$CLASSPATH"
alias antlr4="java -Xmx500M org.antlr.v4.Tool"
alias grun='java org.antlr.v4.gui.TestRig'
export LLVM_DIR="$HOME/llvm-project/build/lib/cmake/llvm:$LLVM_DIR"
export MLIR_INS="$HOME/llvm-project/build/"
export MLIR_DIR="$MLIR_INS/lib/cmake/mlir/" 
export PATH="$MLIR_INS/bin:$PATH" 
export PATH="$HOME/Tester/bin/:$PATH"
export LLVM_SYMBOLIZER_PATH="/Users/jackparsons/llvm-project/build//bin/llvm-symbolizer"

# mojo
export MODULAR_HOME="$HOME/.modular"
export PATH="$MODULAR_HOME/pkg/packages.modular.com_mojo/bin:$PATH"

ZSH_THEME="robbyrussell"

plugins=(git zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# User configuration
alias school="/Users/jackparsons/Desktop/School"

# school
alias repos="cd /Users/jackparsons/Storage/Repositories"

alias f='cd "$(find . -maxdepth 10 -type d | grep -v -e '.git' -e 'node_modules' -e 'Pods' | fzf)"'
alias ff='nvim "$(find . -maxdepth 10 | grep -v -e '.git' -e 'node_modules' -e 'Pods' | fzf)"'

# starship
eval "$(starship init zsh)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

if [ -z "$SSH_AUTH_SOCK" ]; then
   # Check for a currently running instance of the agent
   RUNNING_AGENT="`ps -ax | grep 'ssh-agent -s' | grep -v grep | wc -l | tr -d '[:space:]'`"
   if [ "$RUNNING_AGENT" = "0" ]; then
        # Launch a new instance of the agent
        ssh-agent -s &> $HOME/.ssh/ssh-agent
   fi
   eval `cat $HOME/.ssh/ssh-agent`
fi

