#!/bin/sh

APP_DIR=`dirname $0`

export DISPLAY=:0.0

sleep 3

${APP_DIR}/bin/xkbcomp -R${APP_DIR}/share/X11/xkb/keymap palm-prex ${DISPLAY}
