#!/bin/sh

bar="default"
if [ "$(hostname)" == "cranky-panini" ]; then
  bar="hires"  
fi

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done
# Launch bar on all display
displays=$(xrandr | grep "[^ ]* connected" | cut -d" " -f1)
for display in $displays; do
        if [[ $bar == "hires" && $display == "DP2" || $display == "DP3-1" ]]; then
            bar="default"
        fi
        if [[ $display == "DP3-3" ]]; then
            bar="hdmi"
        fi
        MONITOR=$display polybar $bar &
done
