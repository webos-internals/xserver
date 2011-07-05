#!/bin/sh

APP_DIR=`dirname $0`

export PATH=${APP_DIR}/bin:${PATH}

export LD_LIBRARY_PATH=${APP_DIR}}/xlib:${LD_LIBRARY_PATH}

${APP_DIR}/bin/forker ${APP_DIR}/set_keymap_later.sh

#exec strace -f -o test.log ${APP_DIR}/bin/Xsdl -retro -noreset :0.0 >& /tmp/xserver.log

exec ${APP_DIR}/bin/Xsdl -retro -noreset :0.0 >& /tmp/xserver.log
