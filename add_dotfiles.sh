#!/bin/sh
# Applies dotfiles to the root filesystem.

if [ ! -e add_dotfiles.sh ]; then
    echo Run add_dotfiles.sh in the root directory of the repo.
    exit 1
fi

set -e

export HOME="$(realpath "airootfs/home/julius")"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"


CHEZMOI_FLAGS="--verbose --config $XDG_CONFIG_HOME/chezmoi/chezmoi.toml --destination $HOME --source $XDG_DATA_HOME/chezmoi --persistent-state $XDG_CONFIG_HOME/chezmoi/chezmoistate.boltdb"

echo "Deploy path: $HOME"
echo "Chezmoi flags: $CHEZMOI_FLAGS"
echo Press ENTER to confirm.
read

chezmoi init $CHEZMOI_FLAGS https://github.com/dogeystamp/dots
chezmoi update --apply $CHEZMOI_FLAGS
