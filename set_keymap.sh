#!/bin/sh

APP_DIR=`dirname $0`

export DISPLAY=:0.0

# Determine which keymapping to use...
KEYMAPPING=palm-prex
uname -a|grep tenderloin > /dev/null
if [ "$?" -eq "0" ]; then
  KEYMAPPING=touchpad
fi

${APP_DIR}/bin/xkbcomp -R${APP_DIR}/share/X11/xkb/keymap ${KEYMAPPING} ${DISPLAY}

# Enable sticky-key goodness (for the palm-prex keybindings)
# This is safe for the touchpad mappings.
sleep 1
${APP_DIR}/bin/xkbset exp 60 =sticky =twokey =latchlock
${APP_DIR}/bin/xkbset sticky -twokey latchlock

