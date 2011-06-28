#!/bin/sh
#Launches the x server

export DISPLAY=:0.0

bin/Xsdl -noreset -nolisten tcp -retro $DISPLAY

# cleanup!
rm /tmp/.X* -rf
