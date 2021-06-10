#!/bin/bash

# daemon for notifications like notify-send
/usr/lib/notification-daemon*/notification-daemon &

# run commands specific to the host machine
localcommands > /dev/null 2>&1 &

# turn off auto screen dimming
xset s off dpms 3600 7200 0 &

# simple X hotkey daemon for keybindings
sxhkd -m 1 > /dev/null 2>&1 &

# compositor
picom --no-fading-openclose > /dev/null 2>&1 &

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

# turn on bluetooth controller
bluetoothctl power on > /dev/null 2>&1 &

