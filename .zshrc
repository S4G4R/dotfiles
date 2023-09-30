# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
 source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export ZSH="$HOME/.oh-my-zsh"
source ~/powerlevel10k/powerlevel10k.zsh-theme

# Wait on https://github.com/ohmyzsh/ohmyzsh/issues/8779, then asdf can
# be added as a plugin
. "$HOME/.asdf/asdf.sh"
# append completions to fpath
fpath=(${ASDF_DIR}/completions $fpath)
# initialise completions with ZSH's compinit
autoload -Uz compinit && compinit

plugins=(git history)

source $ZSH/oh-my-zsh.sh

export PATH=$PATH:/usr/lib/postgresql/13/bin:/opt/mssql-tools/bin:$HOME/.fly/bin
export KAFKA_HOME=$HOME/kafka_server
export GRAALVM_HOME=$HOME/graalvm-jdk-20.0.2+9.1
export FLYCTL_INSTALL=$HOME/.fly

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
