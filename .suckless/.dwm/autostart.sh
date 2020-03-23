#!/bin/bash

# daemon for notifications like notify-send
/usr/lib/notification-daemon*/notification-daemon &

# run commands specific to the host machine
$HOME/.scripts/local/localcommands > /dev/null 2>&1 &

# turn off auto screen dimming
xset s off dpms 0 0 0 &

# simple X hotkey daemon for keybindings
if ! [[ "$(pgrep sxhkd)" ]]; then
    sxhkd -m 1 > /dev/null 2>&1 &
fi

# compositor
if [ -x "$(command -v picom)" ]; then
    picom --no-fading-openclose > /dev/null 2>&1 &
else
    compton > /dev/null 2>&1 &
fi

if [ -x "$(command -v dropbox-cli)" ]; then
    dropbox-cli start > /dev/null 2>&1 &
else
    dropbox start > /dev/null 2>&1 &
fi

# statusbar
dwmblocks > /dev/null 2>&1 &

# update X resources database (for st)
xrdb $HOME/.Xresources

# set Norwegian win-keys layout
setxkbmap -layout no -variant winkeys

# turn on bluetooth controller
bluetoothctl power on > /dev/null
