#!/bin/sh
# Perform a full build of the archiso image.

PRIV=run0

set -e

. ./add_dotfiles.sh
run0 mkarchiso -v .
