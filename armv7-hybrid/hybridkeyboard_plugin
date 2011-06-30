#!/bin/sh

export PATH=$PATH:bin
PATH=$PATH:bin

export LD_LIBRARY_PATH=xlib:$PWD/xlib:$LD_LIBRARY_PATH
LD_LIBRARY_PATH=xlib:$PWD/xlib:$LD_LIBRARY_PATH

#LOL
forker set_keymap_later.sh

#exec strace -f -o test.log bin/Xsdl -retro -noreset :0.0 >& /tmp/x.log

exec Xsdl -retro -noreset :0.0 >& /tmp/x.log
