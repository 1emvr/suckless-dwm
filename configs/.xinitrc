#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps


if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi



if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi



if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi



if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
	for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
		[ -x "$f" ] && . "$f"
	done
	unset f
fi

picom -f &
xrandr --output eDP-1 --mode 1920x1200 --output HDMI-1 --same-as eDP-1 &
nitrogen  --restore &

exec dwm

