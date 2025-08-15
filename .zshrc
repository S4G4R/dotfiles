# Setup PATH
export ASDF_DATA_DIR=$HOME/.asdf
export POSTGRES_HOME=$(which psql | xargs dirname)
export PATH=$PATH:${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$HOME/.fly/bin:$POSTGRES_HOME:$HOME/bin:$HOME/.local/bin
export KAFKA_HOME=$(asdf where kafka)
export JAVA_HOME=$(asdf where java)
export FLYCTL_INSTALL=$HOME/.fly
export EDITOR=micro

# append completions to fpath
fpath=(${ASDF_DATA_DIR:-$HOME/.asdf}/completions $fpath)
# initialise completions with ZSH's compinit
autoload -Uz compinit && compinit

# Jump forward and backwards
bindkey "^[[1;5D" backward-word
bindkey "^[[1;5C" forward-word

# history config
setopt histignorespace           # skip cmds w/ leading space from history
setopt histignoredups
setopt sharehistory
setopt histreduceblanks
setopt incappendhistory
HISTFILE="$HOME/.zsh_history"   
SAVEHIST=10000000
HISTSIZE=10000000

# fzf shell integration
# This can replace HSTR, and for that we can move it below the HSTR config
# Directly executing a command doesn't work though, see
# https://github.com/junegunn/fzf/issues/477
source <(fzf --zsh)

# HSTR configuration 
alias hh=hstr                    # hh to be alias for hstr
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
# ensure synchronization between bash memory and history file
export PROMPT_COMMAND="history -a; history -n; ${PROMPT_COMMAND}"
# if this is interactive shell, then bind hstr to Ctrl-r (for Vi mode check doc)
bindkey -s "\C-r" "\C-a hstr -- \C-j"

# Custom aliases
source $HOME/.aliases

eval "$(starship init zsh)"
eval "$(starship completions zsh)"
