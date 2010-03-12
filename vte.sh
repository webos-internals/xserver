#!/bin/bash
#Script to run vte on the palm-pre
# Assumes Xsdl is on the PATH on the phone

KEYMAP_DIR=/usr/local/share/X11/xkb/keymap

Xsdl -nolisten tcp -retro -screen 320x480x32 :0 &
export DISPLAY=:0.0
vte &
xkbcomp palm-pre -R$KEYMAP_DIR $DISPLAY
wait
