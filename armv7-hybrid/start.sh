#!/bin/sh
#Launches the x server

export DISPLAY=:0.0

forker `which bin/Xsdl` -noreset -nolisten tcp -retro $DISPLAY

sleep 3
xkbcomp -R$KEYMAP_DIR palm-prex $DISPLAY

# cleanup!
rm /tmp/.X* -rf
