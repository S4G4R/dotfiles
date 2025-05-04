. "$HOME/.asdf/asdf.sh"
# append completions to fpath
fpath=(${ASDF_DIR}/completions $fpath)
# initialise completions with ZSH's compinit
autoload -Uz compinit && compinit
 
export PATH=$PATH:$ASDF_DATA_DIR/shims:$HOME/.fly/bin:$HOME/bin:$HOME/.local/bin
export KAFKA_HOME=$(asdf where kafka)
export GRAALVM_HOME=$HOME/graalvm-jdk-20.0.2+9.1
export FLYCTL_INSTALL=$HOME/.fly
export ASDF_DATA_DIR=$HOME/.asdf

# Jump forward and backwards
bindkey "^[[1;5D" backward-word
bindkey "^[[1;5C" forward-word

# HSTR configuration - add this to ~/.zshrc
alias hh=hstr                    # hh to be alias for hstr
setopt histignorespace           # skip cmds w/ leading space from history
export HSTR_CONFIG=hicolor       # get more colors
bindkey -s "\C-r" "\C-a hstr -- \C-j"     # bind hstr to Ctrl-r (for Vi mode check doc)

# Custom aliases
alias zshconfig="nano ~/.zshrc"
alias zshsource="source ~/.zshrc"
alias clr=clear
alias sqlserver="sudo /opt/mssql/bin/sqlservr"
alias hostname="wsl.exe hostname -I"

eval "$(starship init zsh)"
eval "$(starship completions zsh)"
