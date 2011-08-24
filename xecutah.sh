#!/bin/sh

APP_DIR=`dirname $0`

export PATH=${APP_DIR}/bin:${PATH}

export LD_LIBRARY_PATH=${APP_DIR}/xlib:${LD_LIBRARY_PATH}

${APP_DIR}/bin/forker ${APP_DIR}/set_keymap_later.sh

RESPONSE=$(luna-send -f -n 1 palm://org.webosinternals.tweaks.prefs/get '{"owner":"org.webosinternals.xserver", "keys":["vkbtype"]}')

export VKB="-vkb $(echo "$RESPONSE"| grep vkbtype|cut -d\" -f4|tr -cd 'a-z')"

if [ "$VKB" == "-vkb " ]; then
    export VKB="";
fi

${APP_DIR}/bin/Xsdl -retro -noreset $VKB :0.0&> /tmp/xserver.log &
