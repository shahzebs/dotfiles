#!/bin/bash

pathtoconfiglist=$HOME/.scripts/dmenu_configs/config_files.txt

query=$(awk '{print $1}' $pathtoconfiglist | dmenu)

if [ "$(echo $query)" ] && [ "$(awk "\$1~/$query/" $pathtoconfiglist)" ]; then
    filename=$(awk "/$query/ {print \$2;exit}" $pathtoconfiglist)
    st -e vim "$filename"
fi
