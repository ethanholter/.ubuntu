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
sudo mv ./nvim.appimage ~/bin
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
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(. /etc/os-release && echo $UBUNTU_CODENAME) main" | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null
sudo apt update -y && sudo apt upgrade -y
sudo apt install ros-humble-desktop python3-rosdep2 tmux python3-venv -y
echo "source /opt/ros/humble/setup.bash" >> ${HOME}/.bashrc
rosdep update
```
</details>


<details>
<summary>Install OpenVPN</summary>

```bash
apt update && apt -y install ca-certificates wget net-tools gnupg
wget https://as-repository.openvpn.net/as-repo-public.asc -qO /etc/apt/trusted.gpg.d/as-repository.asc
echo "deb [arch=amd64 signed-by=/etc/apt/trusted.gpg.d/as-repository.asc] http://as-repository.openvpn.net/as/debian jammy main">/etc/apt/sources.list.d/openvpn-as-repo.list
apt update && apt -y install openvpn-as
```
</details>
