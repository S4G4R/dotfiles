# Download oh-my-zsh
if [ ! -d "$HOME/.oh-my-zsh" ] ; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# Download p10k theme
if [ ! -d "$HOME/powerlevel10k" ] ; then
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
fi

# Download asdf version manager
if [ ! -d "$HOME/.asdf" ] ; then
    git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.13.1
fi

# Add asdf plugins
asdf plugin-add java https://github.com/halcyon/asdf-java.git
asdf plugin-add lein https://github.com/miorimmax/asdf-lein.git
asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
asdf plugin-add kafka https://github.com/ueisele/asdf-kafka.git
asdf plugin-add redis https://github.com/smashedtoatoms/asdf-redis.git

# Install runtimes
asdf install
