#!/bin/bash

# idempotent - yes

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"

if ! [ -f "${HOME}/bin/nvim" ]; then
	wget https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage
	chmod u+x nvim.appimage
	mv ./nvim.appimage ~/bin/nvim
fi

if ! apt list | grep libfuse2; then
	sudo add-apt-repository universe
	sudo apt install libfuse2
fi

if ! [ -d "${HOME}/.config/nvim" ]; then
	git clone https://github.com/ethanholter/dotfiles.nvim ~/.config/nvim
fi

${SCRIPT_DIR}/nerdfont_setup.sh
${SCRIPT_DIR}/lazygit_setup.sh

echo "NVIM setup successfully"

