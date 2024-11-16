# My Ubuntu Dotfiles

```bash
git clone https://github.com/ethanholter/.ubuntu ~/
cd ~/.ubuntu
stow */
```

<details>
<summary>Install Neovim</summary>

```bash
wget https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage 
sudo add-apt-repository universe
sudo apt install libfuse2
chmod u+x nvim.appimage
mkdir -p ~/bin && mv ./nvim.appimage ~/bin/nvim
```
</details>

<details>
<summary>Install GitHub CLI</summary>

```bash
sudo mkdir -p -m 755 /etc/apt/keyrings && wget -qO- https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo tee /etc/apt/keyrings/githubcli-archive-keyring.gpg > /dev/null \
&& sudo chmod go+r /etc/apt/keyrings/githubcli-archive-keyring.gpg \
&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
&& sudo apt update \
&& sudo apt install gh -y
```
```bash
gh auth login
```

</details>

<details>
<summary>Install ROS2 Humble</summary>

```bash
sudo apt update -y && sudo apt upgrade -y && sudo apt install locales -y
sudo locale-gen en_US en_US.UTF-8 -y
sudo update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8 -y
sudo apt install software-properties-common -y
sudo add-apt-repository universe -y
sudo apt update -y && sudo apt install curl -y
sudo curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null
sudo apt update -y && sudo apt upgrade -y
sudo apt install ros-humble-desktop python3-rosdep2 tmux python3-venv -y
echo "source /opt/ros/humble/setup.bash" >> ${HOME}/.bashrc
rosdep update
```
</details>


<details>
<summary>Install OpenVPN</summary>

```bash
sudo apt-get install network-manager-openvpn-gnome
```
</details>

<details>
  <summary>Setup Colloid Theme</summary>

```bash
# gnome packages
sudo apt install gtk2-engines-murrine gnome-tweaks gnome-shell-extensions gnome-themes-extra -y
git clone https://github.com/vinceliuice/Colloid-icon-theme ${HOME}/Themes/Colloid-icon-theme
cd ${HOME}/Themes/Colloid-icon-theme
source ./install.sh -s nord -t all
git clone https://github.com/vinceliuice/Colloid-gtk-theme ${HOME}/Themes/Colloid-gtk-theme
cd ${HOME}/Themes/Colloid-gtk-theme
source ./install.sh -l -c dark -t all --tweaks rimless float
```
</details>

<details>
<summary>Download API keys</summary>

Private repository. Must sign in with gh cli first
```bash
git clone https://github.com/ethanholter/.api-keys ~/
```
</details>

<details>
<summary>Download Node.js (with nvm)</summary>

```bash
export NVM_DIR="$HOME/.nvm" && (
  git clone https://github.com/nvm-sh/nvm.git "$NVM_DIR"
  cd "$NVM_DIR"
  git checkout `git describe --abbrev=0 --tags --match "v[0-9]*" $(git rev-list --tags --max-count=1)`
) && \. "$NVM_DIR/nvm.sh"
nvm install node
```
</details>

<details>
<summary>Download Flatpak</summary>

```bash
sudo apt install flatpak gnome-software-plugin-flatpak
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
```
</details>

<details>
<summary>Misc Tweaks</summary>
  
```bash
gsettings set org.gnome.desktop.wm.preferences button-layout ":minimize,maximize,close" # Add minimize and maximize icons
```
```bash
sudo apt install hstr zoxide fzf ripgrep tmux build-essentials
```

rust:
```bash
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

</details>

Docker:
```bash
for pkg in docker.io docker-doc docker-compose podman-docker containerd runc; do sudo apt-get remove $pkg; done
# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```
