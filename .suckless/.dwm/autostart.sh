#!/bin/bash

# daemon for notifications like notify-send
/usr/lib/notification-daemon*/notification-daemon &

# run commands specific to the host machine
localcommands > /dev/null 2>&1 &

# turn off auto screen dimming
xset s off dpms 0 0 0 &

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

# start clipmenud, a clipboard history manager
clipmenud &
