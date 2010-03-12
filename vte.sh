#Script to run vte on the palm-pre
# Assumes Xsdl is on the PATH on the phone

KEYMAP_DIR=/usr/local/share/X11/xkb/keymap

Xsdl -nolisten tcp -retro -screen 320x480x32 :0 &
DISPLAY=:0.0 vte &
sleep 1
xkbcomp palm-pre -R$KEYMAP_DIR :0.0
wait
