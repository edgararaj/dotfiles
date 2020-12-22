#!/bin/sh

# /etc/X11/xinit/xinitrc
#
# global xinitrc file, used by all X sessions started by xinit (startx)

# disable pc speaker
xset -b

# setup super_l for opening xfce4-whiskermenu
xcape -e "Super_L=Alt_L|F1"

# invoke global X session script
. /etc/X11/Xsession
