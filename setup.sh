sudo apt install curl make rlwrap fontconfig fzf micro eza bat bison

# bat is installed as batcat, setup a symlink
mkdir -p ~/.local/bin
ln -s /usr/bin/batcat ~/.local/bin/bat

# Installs mise and adds activation to ~/.zshrc
curl https://mise.run/zsh | sh

# Install runtimes
mise install

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
