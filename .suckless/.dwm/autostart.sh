#!/bin/bash

IS_VM=$(systemd-detect-virt --vm >/dev/null 2>&1 && echo true || echo false)

if [ "$IS_VM" = false ]; then
    # daemon for notifications like notify-send
    /usr/lib/notification-daemon*/notification-daemon &

    # turn off auto screen dimming
    xset s off dpms 3600 7200 0 &

    # compositor
    picom --no-fading-openclose > /dev/null 2>&1 &

    # turn on bluetooth controller
    bluetoothctl power on > /dev/null 2>&1 &
fi

# run commands specific to the host machine
localcommands > /dev/null 2>&1 &

# simple X hotkey daemon for keybindings
sxhkd -m 1 > /dev/null 2>&1 &

# statusbar
dwmblocks > /dev/null 2>&1 &

# update X resources database (for st)
xrdb $HOME/.Xresources

# dwm read colors from xrdb (syntax from dwmc patch)
dwmc xrdb

# set Norwegian win-keys layout
setxkbmap -layout no -variant winkeys
setxkbmap -option caps:ctrl_modifier
setxkbmap -option altwin:menu_win

# start clipmenud, a clipboard history manager
clipmenud &
