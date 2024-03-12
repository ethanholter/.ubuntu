#!/bin/bash

# install zoxide
if ! [ -f "${HOME}/.local/bin/zoxide" ]; then
    curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | bash
else
    echo "zoxide already installed"
fi

# add zoxide to bashrc
if ! grep -qF 'eval "$(zoxide init bash)"' ${HOME}/.bashrc; then
    echo 'eval "$(zoxide init bash)"' >> ${HOME}/.bashrc
else
    echo "zoxide already in bashrc"
fi

# install starship
if ! [ -f "/usr/local/bin/starship" ]; then
    curl -sS https://starship.rs/install.sh | sh
else
    echo "starship already installed"
fi

# add starship to bashrc
if ! grep -qF 'eval "$(starship init bash)"' ${HOME}/.bashrc; then
    echo 'eval "$(starship init bash)"' >> ${HOME}/.bashrc
else
    echo "starship already in bashrc"
fi

# install fzf
sudo apt install fzf

# configure starship

mkdir -p ~/.config && cp ./configs/starship.toml ~/.config/starship.toml



./scripts/nerdfont_setup.sh
