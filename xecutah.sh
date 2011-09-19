#!/bin/sh

export DISPLAY=${DISPLAY:-:0.0}

APP_DIR=`dirname $0`

export PATH=${APP_DIR}/bin:${PATH}

export LD_LIBRARY_PATH=${APP_DIR}/xlib:${LD_LIBRARY_PATH}

RESPONSE=$(luna-send -f -n 1 palm://org.webosinternals.tweaks.prefs/get '{"owner":"org.webosinternals.xserver", "keys":["vkbtype"]}')

export VKB="-vkb $(echo "$RESPONSE"| grep vkbtype|cut -d\" -f4|tr -cd 'a-z')"

if [ "$VKB" == "-vkb " ]; then
    export VKB="";
fi

xinit() {
	${APP_DIR}/set_keymap.sh
	# Invoke user's .xinitrc, ignore errors
	/media/internal/.xinitrc

	# Kill the sleep process
	kill $SLEEP_PID
}

# Spawn a process that sleeps for 15 seconds, and we wait on it after the X server starts
# However, if/when the xserver is ready for clients (like xkb, and xinitrc script goodness)
# it's configured to send us a SIGUSR1--which we handle, invoke the desired startup stuff
# and then kill the sleeper.  If there's a failure, this means we'll give it 15 seconds
# before calling it a lost cause.
(sleep 15) &
export SLEEP_PID=$!
trap xinit SIGUSR1

${APP_DIR}/bin/Xsdl -retro -noreset $VKB ${DISPLAY} &> /tmp/xserver.log &

wait $SLEEP_PID || (exit 0)
