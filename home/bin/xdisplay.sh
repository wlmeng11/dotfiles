#!/bin/bash

if xrandr -q | grep "VGA1 connected" > /dev/null ; then
	xrandr --output LVDS1 --mode 1366x768 --primary --output VGA1 --mode 1920x1080 --above LVDS1
elif xrandr -q | grep "DP1 connected" > /dev/null ; then
	xrandr --auto
	xrandr --output LVDS1 --off
	xmodmap ~/.Xmodmap
else
	xrandr --auto
	xrandr --output VGA1 --off
	xrandr --output DP1 --off
fi
