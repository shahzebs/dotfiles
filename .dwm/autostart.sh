#!/bin/bash

/usr/lib/notification-daemon/notification-daemon &

$HOME/.scripts/local/localcommands > /dev/null 2>&1 &

xset s off -dpms &

if ! [[ "$(pgrep sxhkd)" ]]; then
    sxhkd -m 1 > /dev/null 2>&1 &
fi

compton > /dev/null 2>&1 &

dropbox start > /dev/null 2>&1 &

dwmblocks > /dev/null 2>&1 &

