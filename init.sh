#!/usr/bin/env bash

set -euo pipefail

export PATH="$HOME/.nix-profile/bin:$PATH"

# Install nix
# Enable flakes + the new nix CLI
sudo chown $USERNAME ~/.config/
mkdir -p ~/.config/nix
echo "experimental-features = nix-command flakes" > ~/.config/nix/nix.conf

# Provides nix-shell
sudo apt update && sudo apt upgrade -y
sudo apt install curl -y

sh <(curl -L https://nixos.org/nix/install) --no-daemon --yes
. ~/.nix-profile/etc/profile.d/nix.sh

nix-channel --add https://nixos.org/channels/nixpkgs-unstable nixpkgs-unstable
nix-channel --update

echo 'export PATH="$HOME/.nix-profile/bin:$PATH"' >> ~/.bashrc
echo 'export PATH="$HOME/.nix-profile/bin:$PATH"' >> ~/.profile

nix registry add datalab "$WORKSPACE_DIR/$(basename ${GIT_REPOSITORY:-datalab})"

: "${LODEX_TEMPLATE:?LODEX_TEMPLATE must be set (secret Onyxia)}"

cd "$WORKSPACE_DIR/$(basename ${GIT_REPOSITORY:-datalab})"

rm -rf data
mkdir -p data

export TEMPLATE_FILE="data/$(basename "$LODEX_TEMPLATE")"

# duckdb, mc, unzip... come from flake.nix
nix develop datalab --no-write-lock-file --command bash -euo pipefail -c '
    mc cp s3/"$LODEX_TEMPLATE" "$TEMPLATE_FILE"
    unzip -o -q -d data .
    find data -name "*.tar.gz" -execdir tar -xzf {} \;

    # Run from data/ so the globs in up.sql do not scan the whole repository
    cd data
    duckdb ../lodex-template-usage.db -c ".read ../sql/up.sql"
'
