#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

battery() {
	batt="$(acpi -b)"
	printf " $batt " 
}

memory() {
	mem=`free | awk '/Mem/ {printf "%d MiB/%d MiB\n", $3 / 1024.0, $2 / 1024.0}'`
	printf "Mem: $mem "
}

cpu() {
	cpu=`top -b -n1 | grep "Cpu(s)" | awk '{print $2 + $4}'`
	printf "Cpu: $cpu "
}


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

xrandr --output eDP-1 --mode 1920x1200 --output HDMI-1 --mode 1920x1080 &
picom -f &
nitrogen  --restore &


while true; do
	xsetroot -name "$(memory) | $(cpu) | $(battery) | $(date)"
	sleep 1s
done &
exec dwm

