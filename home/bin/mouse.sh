#!/bin/sh

# Synaptics Touchpad
synclient HorizTwoFingerScroll=1 # Enable multitouch horizontal scrolling
synclient TapButton1=0 # Disable tap to click
synclient TapButton2=0 # Disable tap to click
synclient TapButton3=0 # Disable tap to click
synclient CoastingSpeed=0 # Disable inertial scrolling

# Trackpoint
xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation" 1
xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Button" 2
xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Timeout" 200

xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Axes" 6 7 4 5 # Horizontal scrolling

xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Middle Button Emulation" 1
xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Middle Button Timeout" 50

# Logitech Marble Mouse
xinput set-prop "Logitech USB-PS/2 Optical Mouse" 290 10
xinput set-prop "Logitech USB-PS/2 Optical Mouse" 286 1
xinput set-prop "Logitech USB-PS/2 Optical Mouse" 287 6 7 4 5
