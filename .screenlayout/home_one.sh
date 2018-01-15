#!/bin/sh
xrandr --output HDMI1 --primary --mode 2560x1440 --pos 1920x0 --rotate normal --output VIRTUAL1 --off --output DP1 --off --output eDP1 --off --output VGA1 --off

i3-refresh
