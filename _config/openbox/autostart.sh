#!/bin/bash
tint2 &
conky -q &
volumeicon &
batti &
nitrogen --restore &
xautolock -time 7 -locker "/usr/bin/xlock -mode pacman"
xflux -z 97210 &
pcmanfm -d &
#(sleep 3 && /usr/bin/nm-applet --sm-disable) &
#xcompmgr &
#xbacklight -set 100 &
#/usr/bin/synclient TouchpadOff=1 &
#fbxkb &
