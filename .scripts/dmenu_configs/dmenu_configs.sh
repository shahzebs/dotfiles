#!/bin/bash

filename=$(awk "/$(cat /home/shahzebs/.scripts/dmenu_configs/config_files.txt | awk '{print $1}' | dmenu)/ {print \$2}" /home/shahzebs/.scripts/dmenu_configs/config_files.txt)

if [[ "$filename" != *$'\n'* ]]; then
    gnome-terminal -- /bin/sh -c "vim $filename; $SHELL"
fi
