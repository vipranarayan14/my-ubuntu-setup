#!/bin/bash

# Update system pkgs

sudo apt update \
&& sudo apt upgrade

# Install fish

sudo apt-add-repository ppa:fish-shell/release-3 \
&& sudo apt update \
&& sudo apt install fish

# Set fish as default shell

## SRC: https://fishshell.com/docs/current/index.html#default-shell
chsh -s /usr/local/bin/fish

# Install fish plugin manager

curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher

# Install fish plugins

fisher install IlanCosman/tide@v5 # Prompt
fisher install jorgebucaran/nvm.fish # NVM

# Install Node & NPM

nvm install lts

# Install gh

## SRC: https://github.com/cli/cli/blob/trunk/docs/install_linux.md
type -p curl >/dev/null || sudo apt install curl -y
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg \
&& sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg \
&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
&& sudo apt update \
&& sudo apt install gh -y

# Install bat

curl -sSL -o /tmp/bat.deb https://github.com/sharkdp/bat/releases/download/v0.22.1/bat-musl_0.22.1_amd64.deb
sudo apt install /tmp/bat.deb

