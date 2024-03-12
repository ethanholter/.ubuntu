#!/bin/bash

# idempotent - yes

yes | sudo apt install git gpg pass

pass init GitHub

read -p "Configure name and email? (y/n) " A

if [ $A = "y" ]; then
  read -p "Enter fullname: " FULLNAME
  read -p "Enter email: " EMAIL
  git config --global --replace-all user.name "${FULLNAME}"
  git config --global --replace-all user.email $EMAIL
fi
unset A


# set up global .gitignore
if ! [ -f ${HOME}/.gitignore ]; then
  touch ${HOME}/.gitignore
  echo ".vscode" >> ${HOME}/.gitignore
fi
git config --global core.excludesFile '~/.gitignore'


git config --global --replace-all pull.rebase true
git config --global --replace-all rebase.autoStash true
git config --global --replace-all core.editor "code"
git config --global --replace-all color.ui true
git config --global --unset credential.helper
git config --global --replace-all credential.credentialStore gpg

echo "git setup completed"