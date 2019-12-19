#!/bin/bash

# $HOME/.screenlayout/fysikkland_threemonitor.sh &

$HOME/.fehbg &

if ! [[ "$(pgrep sxhkd)" ]]; then
    sxhkd > /dev/null 2>&1 &
fi

compton > /dev/null 2>&1 &

$HOME/.scripts/dwmbar &
