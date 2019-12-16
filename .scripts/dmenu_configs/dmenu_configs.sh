#!/bin/bash

filename=$(awk "/$(cat $HOME/.scripts/dmenu_configs/config_files.txt | awk '{print $1}' | dmenu)/ {print \$2}" $HOME/.scripts/dmenu_configs/config_files.txt)

filedir=$(echo $filename | sed 's|\(.*\)\/.*|\1|')

if [[ "$filename" != *$'\n'* ]]; then
    gnome-terminal --working-directory=$filedir -- /bin/sh -c "vim $filename; $SHELL"
fi
