#!/bin/bash

INSTALL_SH_PATH="$(realpath install.sh)"

# Validate install.sh path
if [ "$INSTALL_SH_PATH" != "$HOME/dotfiles/install.sh" ]; then
    echo "ERROR: Place dotfiles/install.sh on your home as $HOME/dotfiles/install.sh"
    echo "Current path: $INSTALL_SH_PATH"
    exit 1
fi

# Validate if caller is $HOME/dotfiles
if [ "$(pwd)" != "$HOME/dotfiles" ]; then
    echo "ERROR: Run dotfiles/install.sh in $HOME/dotfiles"
    echo "Current path: $(pwd)"
    exit 1
fi

for DOTFILE in .??*
do
  # Ignore some files
  [[ "$DOTFILE" == ".git" ]] && continue
  [[ "$DOTFILE" == "git" ]] && continue
  [[ "$DOTFILE" == ".DS_Store" ]] && continue


  if [[ -f "$HOME/$DOTFILE" ]]; then
    # Check if file is symlink
    if [[ -L "$HOME/$DOTFILE" ]]; then
      echo "Symlink $HOME/$DOTFILE exist "
    else
      # Move file as backup
      echo "$HOME/$DOTFILE exist, move as backup"
      mv "$HOME/$DOTFILE" "$HOME/$DOTFILE.bk"
      echo "Symlink Created $HOME/$DOTFILE"
      ln -s ./dotfiles/$DOTFILE $HOME/$DOTFILE
    fi
  else
    echo "Symlink Created $HOME/$DOTFILE"
    ln -s ./dotfiles/$DOTFILE $HOME/$DOTFILE
  fi
done

