#!/bin/sh
#Launches the x server

#This is where the X server lives
APP_DIR=/media/cryptofs/apps/usr/palm/applications/org.webosinternals.xserver

#Start the x-server
DISPLAY=:0.0 $APP_DIR/start.sh
