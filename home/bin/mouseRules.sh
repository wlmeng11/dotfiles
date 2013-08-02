#!/bin/sh

synclient HorizTwoFingerScroll=1 # Enable multitouch horizontal scrolling
synclient TapButton1=0 # Disable tap to click
synclient TapButton2=0 # Disable tap to click
synclient TapButton3=0 # Disable tap to click

xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation" 1
xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Button" 2
xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Timeout" 200

xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Axes" 6 7 4 5 # Horizontal scrolling

xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Middle Button Emulation" 1
xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Middle Button Timeout" 50
