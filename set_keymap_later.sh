#!/bin/sh

APP_DIR=`dirname $0`

export DISPLAY=:0.0

sleep 3

${APP_DIR}/bin/xkbcomp -R${APP_DIR}/share/X11/xkb/keymap palm-prex ${DISPLAY}

# Enable sticky-key goodness (for the palm-prex keybindings)
sleep 1
${APP_DIR}/bin/xkbset exp 60 =sticky =twokey =latchlock
${APP_DIR}/bin/xkbset sticky -twokey latchlock

