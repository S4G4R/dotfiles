export PATH=$PATH:${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$HOME/.fly/bin:$HOME/bin:$HOME/.local/bin
export KAFKA_HOME=$(asdf where kafka)
export JAVA_HOME=$(asdf where java)
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

# HSTR configuration 
alias hh=hstr                    # hh to be alias for hstr
setopt histignorespace           # skip cmds w/ leading space from history
export HSTR_CONFIG=hicolor       # get more colors
hstr_no_tiocsti() {
    zle -I
    { HSTR_OUT="$( { </dev/tty hstr ${BUFFER}; } 2>&1 1>&3 3>&- )"; } 3>&1;
    BUFFER="${HSTR_OUT}"
    CURSOR=${#BUFFER}
    zle redisplay
}
zle -N hstr_no_tiocsti
bindkey '\C-r' hstr_no_tiocsti
export HSTR_TIOCSTI=y
HISTCONTROL=ignorespace   # leading space hides commands from history
HISTFILE="$HOME/.zsh_history"
SAVEHIST=10000000
HISTSIZE=10000000
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
