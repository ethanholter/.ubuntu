#!/usr/bin/env bash
set -eo pipefail

sudo apt install -y bpytop network-manager-openvpn-gnome zoxide thefuck fzf cava neofetch bpytop gnome-tweaks gnome-shell-extensions gnome-themes-extra ubuntu-restricted-* zoxide network-manager-openvpn-gnome

curl -sS https://starship.rs/install.sh | sh

# basic home directories
mkdir -p ~/Downloads ~/bin ~/Pictures ~/Workspaces ~/Videos ~/Music ~/Documents

# lazygit
read -rp "Install lazygit? [Y/n] " lazygit
if [ "${lazygit-='y'}" = "y" ]; then
    LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*') &&
        curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz" &&
        tar xf lazygit.tar.gz lazygit &&
        sudo install lazygit /usr/local/bin &&
        rm lazygit*
fi

# nvim

read -rp "Install nvim? [Y/n] " nvim
if [ "${nvim-='y'}" = "y" ]; then
    wget https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage &&
        sudo add-apt-repository universe &&
        sudo apt install libfuse2 &&
        chmod u+x nvim.appimage &&
        sudo mv ./nvim.appimage ~/bin
fi

# gh CLI
read -rp "setup github cli? [Y/n] " ghcli
if [ "${ghcli-='y'}" = "y" ]; then
    sudo mkdir -p -m 755 /etc/apt/keyrings && wget -qO- https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo tee /etc/apt/keyrings/githubcli-archive-keyring.gpg >/dev/null &&
        sudo chmod go+r /etc/apt/keyrings/githubcli-archive-keyring.gpg &&
        echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list >/dev/null &&
        sudo apt update &&
        sudo apt install gh -y &&
        gh auth login
fi

# ros2 humble
read -rp "Install ROS2 humble? [Y/n] " humble
if [ "${humble-='y'}" = "y" ]; then
    sudo apt update -y && sudo apt upgrade -y && sudo apt install locales -y
    sudo locale-gen en_US en_US.UTF-8 -y
    sudo update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8 -y
    sudo apt install software-properties-common -y
    sudo add-apt-repository universe -y
    sudo apt update -y && sudo apt install curl -y
    sudo curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(. /etc/os-release && echo $UBUNTU_CODENAME) main" | sudo tee /etc/apt/sources.list.d/ros2.list >/dev/null
    sudo apt update -y && sudo apt upgrade -y
    sudo apt install ros-humble-desktop python3-rosdep2 tmux python3-venv -y
    echo "source /opt/ros/humble/setup.bash" >>${HOME}/.bashrc
    rosdep update
fi

# Set theme
gsettings set org.gnome.shell.extensions.user-theme name 'Colloid-Teal-Dark'
gsettings set org.gnome.desktop.interface icon-theme 'Colloid-teal-nord-dark'

sudo snap install code --classic
