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

/usr/bin/start-pulseaudio-x11

# time correction - only run if network active - now run by systemctl
# sudo ntpd -q

#xbacklight -set 40
#xrdb .Xresources
date >> ~/boot.log
xsetroot -cursor_name left_ptr
#unclutter -idle 2 &
#redshift &

xrandr --dpi 106

#eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
#export SSH_AUTH_SOCK

eval $(ssh-agent)

exec /usr/bin/xmonad
