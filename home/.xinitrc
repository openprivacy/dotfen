#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

#if [ -d /etc/X11/xinit/xinitrc.d ]; then
#  for f in /etc/X11/xinit/xinitrc.d/*; do
#    [ -x "$f" ] && . "$f"
#  done
#  unset f
#fi

source /etc/X11/xinit/xinitrc.d/30-dbus.sh

/usr/bin/start-pulseaudio-x11

#xbacklight -set 40
#xrdb .Xresources
date >> ~/boot.log
xsetroot -cursor_name left_ptr
#unclutter -idle 2 &
#/usr/bin/urxvtd -q -f -o
#/usr/bin/lxterminal
#redshift &
#eval $(ssh-agent)

eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK

#exec /home/fen/.cabal/bin/xmonad
exec /usr/bin/xmonad
