#!/bin/bash

# idempotent - yes

FONTNAME="MartianMono"

# Install Nerd Fonts
if ! [ -d ~/.local/share/fonts ]; then
	mkdir -p ~/.local/share/fonts
fi

# Download and install the font

if ! [ -f ~/.local/share/fonts/${FONTNAME}* ]; then
	mkdir tmp/
	curl -OL https://github.com/ryanoasis/nerd-fonts/releases/latest/download/${FONTNAME}.tar.xz --output-dir tmp/
	tar -xf ${FONTNAME}.tar.xz -C tmp/
	mv tmp/*.ttf ~/.local/share/fonts
	rm -rf tmp/

	# Update the font cache
	sudo fc-cache -fv

	echo "${FONTNAME} installed successfully"
else
	echo "${FONTNAME} already installed"
fi