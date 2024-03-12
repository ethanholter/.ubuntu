# My Ubuntu Dotfiles

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
</details>

<details>
<summary>Install ROS2 Humble</summary>

```bash
TODO
```
</details>
