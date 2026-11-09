#!/bin/bash

function ask() {
    read -p "$1 (Y/n): " response
    [ -z "$response" ] || [ "$response" = "y" ]
}

for script in shell/*
do
    fullpath=$(realpath $script)
    if ask "Source ${file}?"; then
        echo "source $fullpath" >> ~/.bashrc
    fi
done

read -p "Create & source .ssh_aliases? (Y/n): " resp
if [ -z "$resp" ] || [ "$resp" = "y" ]; then
    if [ ! -f ~/.ssh_aliases ]; then
        touch ~/.ssh_aliases
    fi
    echo "source ~/.ssh_aliases" >> ~/.bashrc
fi

for file in ".vimrc" ".tmux.conf"; do
    if ask "Install ${file}?"; then
        ln -s "$(realpath "$file")" ~/${file}
    fi
done

# Another yn

printf 'Is this a good question (y/n)? '
read answer

if [ "$answer" != "${answer#[Yy]}" ] ;then 
    echo Yes
else
    echo No
fi

# Notes

function trace() {
    strace -e execve whoami
    ldd shell.sh
}

if [ $USER == "devops" ]; then
    echo "Welcome, DevOps Engineer!"
else
    echo "Access denied."
fi

for i in {1..5}; do
    echo "Number $i"
done

count=1
while [ $count -le 5 ]; do
    echo "Count $count"
    ((count++))
done