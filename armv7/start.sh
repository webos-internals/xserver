#!/bin/sh
#Launches the x server

DISPLAY=:0.0

#This is where the X server lives
APP_DIR=/media/cryptofs/apps/usr/palm/applications/org.webosinternals.xserver
KEYMAP_DIR=$APP_DIR/share/X11/xkb/keymap

export PATH=$APP_DIR/bin:$PATH
#Portrait orientation
forker `which Xsdl` -noreset -nolisten tcp -retro -screen 320x480x24 $DISPLAY
#Landscape
#Xsdl -noreset -nolisten tcp -retro -screen 480x320x24 $DISPLAY &

sleep 1
xkbcomp -R$KEYMAP_DIR palm-prex $DISPLAY

# Make the modifiers sticky!
sleep 1
xkbset exp 60 =sticky =twokey =latchlock
xkbset sticky -twokey latchlock

#XXX: Add code that runs ~/.xinitrc or /media/internal/xinitrc if it exists?

