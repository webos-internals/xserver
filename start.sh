#!/bin/sh
#Launches the x server

#This is where the X server lives
APP_DIR=/media/cryptofs/apps/usr/palm/applications/org.webosinternals.xorg-server
KEYMAP_DIR=$APP_DIR/share/X11/xkb/keymap

export PATH=$APP_DIR/bin:$PATH
#Portrait orientation
Xsdl -noreset -nolisten tcp -retro -screen 320x480x24 :0 &
#Landscape
#Xsdl -noreset -nolisten tcp -retro -screen 480x320x24 :0 &

sleep 1
xkbcomp -R$KEYMAP_DIR palm-pre :0.0
wait

#XXX: Add code that runs ~/.xinitrc or /media/internal/xinitrc if it exists?

