#!/usr/bin/env bash
xrandr --output eDP-1 --mode 1920x1200 --output HDMI-1 --mode 1920x1080 &
picom -f &
nitrogen  --restore &

battery() {
	batt="$(acpi -b)"
	printf " $batt% "
}

memory() {
	mem=$(free | awk '/Mem/ {printf "%d MiB/%d MiB\n", $3 / 1024.0, $2 / 1024.0}')
	printf "Mem: %s" "$mem"
}

cpu() {
	cpu=$(top -b -n1 | grep "Cpu(s)" | awk '{print $2 + $4}')
	printf "Cpu: %s " "$cpu"
}

while true; do
	xsetroot -name "$(memory) | $(cpu) | $(battery) | $(date)"
	sleep 1s
done &
