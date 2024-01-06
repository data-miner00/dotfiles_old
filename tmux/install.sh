#!/bin/bash

# Check if tmux is installed. If not, print install guide and exit.

if [ ! "tmux --version" ]; then
    echo tmux is not installed. Refer to the installation guide for your distro. https://github.com/tmux/tmux/wiki/Installing
    echo After installing tmux, run this script again.
    exit 0
fi

TPM_REPO_URL=https://github.com/tmux-plugins/tpm.git
TPM_DIR=~/.tmux/plugins/tpm
TMUX_CONFIG=.tmux.conf

if [ ! -d "$TPM_DIR" ]; then
    git clone $TPM_REPO_URL $TPM_DIR
fi

function createTmuxConfig () {
    echo "Creating $TMUX_CONFIG at root"

    echo "unbind r" > ~/$TMUX_CONFIG
    echo "bind r source-file ~/$TMUX_CONFIG" >> ~/$TMUX_CONFIG
    echo "" >> ~/$TMUX_CONFIG
    echo "set -g prefix C-s" >> ~/$TMUX_CONFIG
    echo "" >> ~/$TMUX_CONFIG
    echo "" >> ~/$TMUX_CONFIG
    echo "bind-key h select-pane -L" >> ~/$TMUX_CONFIG
    echo "bind-key j select-pane -D" >> ~/$TMUX_CONFIG
    echo "bind-key k select-pane -U" >> ~/$TMUX_CONFIG
    echo "bind-key l select-pane -R" >> ~/$TMUX_CONFIG
    echo "" >> ~/$TMUX_CONFIG
    echo "# List of plugins here" >> ~/$TMUX_CONFIG
    echo "set -g @plugin 'tmux-plugins/tpm'" >> ~/$TMUX_CONFIG
    echo "" >> ~/$TMUX_CONFIG
    echo "" >> ~/$TMUX_CONFIG
    echo "# Init tmux plugin manager (keep this at bottom)" >> ~/$TMUX_CONFIG
    echo "run '~/.tmux/plugins/tpm/tpm'" >> ~/$TMUX_CONFIG
    cat ~/$TMUX_CONFIG
}

while true; do
    read -p "Do you wish to create a default $TMUX_CONFIG file? [Y/n]: " response
    case $response in
        [Yy]* ) echo "Yes"; createTmuxConfig; break;;
        [Nn]* ) echo "No"; break;;
        * ) echo "Please answer Y/n only";;
    esac
done
