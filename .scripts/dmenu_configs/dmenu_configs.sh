#!/bin/bash
shopt -s expand_aliases
alias dmenu='dmenu -fn "UbuntuMono Nerd Font:size=10" -nb "#222222" -nf "#bbbbbb" -sb "#006666" -sf "#eeeeee"'

pathtoconfiglist=$HOME/.scripts/dmenu_configs/config_files.txt

menulist="$(awk '{print $1}' $pathtoconfiglist)\nstatusbar"
query=$(echo -e "$menulist" | dmenu -p "What do you want to configure?")

if [ "$(echo $query)" ] && [ "$(awk "\$1~/$query/" $pathtoconfiglist)" ]; then
    filename=$(awk "/^$query\s/ {print \$2;exit}" $pathtoconfiglist)
    st -e vim "$filename"
elif [ "$query" = "statusbar" ]; then
    files="$(ls $HOME/.scripts/statusbar/)"
    file="$(echo "$files" | dmenu -p "Which part of the statusbar?")"
    if [ "$(echo $file)" ] && [ "$(echo "$files" | awk "\$1~/$file/")" ]; then
        st -e vim "$HOME/.scripts/statusbar/$file"
    fi
fi
