#!/bin/bash

if xrandr -q | grep "VGA1 connected" > /dev/null ; then
	xrandr --output LVDS1 --mode 1366x768 --primary --output VGA1 --mode 1920x1080 --above LVDS1
else
	xrandr --auto
	xrandr --output VGA1 --off
fi
