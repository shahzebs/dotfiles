#!/bin/bash

$HOME/.scripts/local/localcommands > /dev/null 2>&1 &

$HOME/.fehbg &

if ! [[ "$(pgrep sxhkd)" ]]; then
    sxhkd -m 1 > /dev/null 2>&1 &
fi

compton > /dev/null 2>&1 &

dropbox start > /dev/null 2>&1 &

dwmblocks > /dev/null 2>&1 &

