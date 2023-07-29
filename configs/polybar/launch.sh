#!/usr/bin/env bash

# Terminate already running bar instances
# If all your bars have ipc enabled, you can use 

killall -q polybar
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

if type "xrandr"; then
  for i in $(xrandr --query | grep " connected" | cut -d " " -f1); do
    MONITOR=$i polybar --reload bar &
  done
else
  polybar --reload bar &
fi

echo "Bars launched..."
