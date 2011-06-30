#!/bin/sh
#Launches the x server

export DISPLAY=:0.0

# forker `which bin/Xsdl` -noreset -nolisten tcp -retro $DISPLAY

sleep 3
xkbcomp -Rshare/X11/xkb/keymap palm-prex $DISPLAY
