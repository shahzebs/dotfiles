#!/bin/bash

pathtoconfiglist=$HOME/.scripts/dmenu_configs/config_files.txt

filename=$(awk "/$(cat $pathtoconfiglist | awk '{print $1}' | dmenu)/ {print \$2}" $pathtoconfiglist)

filedir=$(echo $filename | sed 's|\(.*\)\/.*|\1|')

if [[ $filename ]] && [[ "$filename" != *$'\n'* ]] ; then
    gnome-terminal --working-directory=$filedir -- /bin/sh -c "vim $filename; $SHELL"
fi
