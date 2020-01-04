#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

/usr/bin/start-pulseaudio-x11

date >> ~/boot.log
xsetroot -cursor_name left_ptr

# xrandr --dpi 106

# dunst &

# Inactivity time-based locking:
# xautolock -time 10 -corners -000 -locker '/home/fen/bin/out-lock' -killtime 30 -killer 'systemctl suspend' -notify 30 -notifier "notify-send -- 'Locking screen in 30 seconds'"

exec i3
