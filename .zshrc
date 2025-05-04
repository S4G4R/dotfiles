export PATH=$PATH:${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$HOME/.fly/bin:$HOME/bin:$HOME/.local/bin
export KAFKA_HOME=$(asdf where kafka)
export GRAALVM_HOME=$HOME/graalvm-jdk-20.0.2+9.1
export FLYCTL_INSTALL=$HOME/.fly
export ASDF_DATA_DIR=$HOME/.asdf

# append completions to fpath
fpath=(${ASDF_DATA_DIR:-$HOME/.asdf}/completions $fpath)
# initialise completions with ZSH's compinit
autoload -Uz compinit && compinit

# Jump forward and backwards
bindkey "^[[1;5D" backward-word
bindkey "^[[1;5C" forward-word

# HSTR configuration - add this to ~/.bashrc
alias hh=hstr                    # hh to be alias for hstr
export HSTR_CONFIG=hicolor       # get more colors
export HISTCONTROL=ignorespace   # leading space hides commands from history
export HISTFILE=$HOME/.zhistory
export SAVEHIST=10000            
export HISTFILESIZE=10000        # increase history file size (default is 500) 
export HISTSIZE=${HISTFILESIZE}  # increase history size (default is 500)
# ensure synchronization between bash memory and history file
export PROMPT_COMMAND="history -a; history -n; ${PROMPT_COMMAND}"
# if this is interactive shell, then bind hstr to Ctrl-r (for Vi mode check doc)
bindkey -s "\C-r" "\C-a hstr -- \C-j"

# Custom aliases
alias zshconfig="nano ~/.zshrc"
alias zshsource="source ~/.zshrc"
alias clr=clear
alias sqlserver="sudo /opt/mssql/bin/sqlservr"
alias hostname="wsl.exe hostname -I"

eval "$(starship init zsh)"
eval "$(starship completions zsh)"
