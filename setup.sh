sudo apt install curl make rlwrap fontconfig

# Download asdf version manager
if [ ! -d "$HOME/.asdf" ] ; then
    wget https://github.com/asdf-vm/asdf/releases/download/v0.16.6/asdf-v0.16.6-linux-amd64.tar.gz
    tar -xvzf asdf-v0.16.6-linux-amd64.tar.gz
    chmod +x asdf
    mkdir $HOME/bin
    mv asdf $HOME/bin/asdf
    rm asdf-v0.16.6-linux-amd64.tar.gz
fi

# Add asdf plugins
asdf plugin add java
asdf plugin add clojure https://github.com/asdf-community/asdf-clojure.git
asdf plugin add lein https://github.com/miorimmax/asdf-lein.git
asdf plugin add babashka https://github.com/pitch-io/asdf-babashka.git
asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
asdf plugin add kafka https://github.com/ueisele/asdf-kafka.git
asdf plugin add kcctl https://github.com/joschi/asdf-kcctl.git
asdf plugin add redis https://github.com/smashedtoatoms/asdf-redis.git
asdf plugin add argocd https://github.com/beardix/asdf-argocd.git
asdf plugin add firebase
asdf plugin-add tmux https://github.com/aphecetche/asdf-tmux.git
asdf plugin add fzf https://github.com/kompiro/asdf-fzf.git

# Install runtimes
asdf install

# Install starship
curl -sS https://starship.rs/install.sh | sh

# Install fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/Meslo.zip
mkdir -p .local/share/fonts
unzip Meslo.zip -d .local/share/fonts
cd .local/share/fonts
rm *Windows*
cd ~
rm Meslo.zip
fc-cache -fv
