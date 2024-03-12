#!/bin/bash

# idempotent - yes

# Add execution privileges to all of the scripts
for file in "scripts"/*.sh; do
    if [ -f "$file" ] && [ -x "$file" ]; then
        echo "Skipping $file"
    elif [ -f "$file" ]; then
        chmod +x "$file"
        echo "Added execution privileges to $file."
    fi
done

# Create user bin directory
if ! [ -d "${HOME}/bin" ]; then
    mkdir ~/bin
    PATH="${HOME}/bin:${PATH}"
else
    echo "bin directory already exists"
fi

# add ~/bin dir to path if not present in bashrc already
if ! grep -qF "PATH=\"${HOME}/bin:\${PATH}\"" ~/.bashrc; then
    echo "PATH=\"${HOME}/bin:\${PATH}\"" >> ~/.bashrc
else
    echo "bin directory already in PATH"
fi

echo Done
