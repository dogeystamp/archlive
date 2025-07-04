#!/bin/sh
# Applies dotfiles to the root filesystem.
# RUN THIS IN THE SAME DIRECTORY AS THIS SCRIPT.

set -e

chezmoi init --verbose --config airootfs/home/julius/.config/chezmoi/chezmoi.toml --destination airootfs/home/julius dogeystamp/dotfiles
chezmoi update --apply --verbose --config airootfs/home/julius/.config/chezmoi/chezmoi.toml --destination airootfs/home/julius
