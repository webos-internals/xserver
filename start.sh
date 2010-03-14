#!/bin/sh

#Script to run vte on the palm-pre
# Assumes Xsdl is on the PATH on the phone

#XXX: Grab this from pwd? dirname $0, etc?
APP_DIR=/media/cryptofs/apps/usr/palm/applications/org.webosinternals.xlauncher
KEYMAP_DIR=$APP_DIR/share/X11/xkb/keymap

export PATH=$PATH:$APP_DIR/bin
#Portrait orientation
#(for landscape, use 480x320)
Xsdl -nolisten tcp -retro -screen 320x480x24 :0 &
sleep 1
#DISPLAY=:0.0 vte &
xkbcomp -R$KEYMAP_DIR palm-pre :0.0
wait
