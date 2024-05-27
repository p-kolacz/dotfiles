#!/bin/bash

bspc rule -r "*"
bspc rule -a Screenkey manage=off
bspc rule -a scratchpad state=floating sticky=on rectangle=1200x600+0+0 center=true
bspc rule -a Gimp desktop=G follow=on
bspc rule -a Brave-browser desktop=W
bspc rule -a thunderbird desktop=C
bspc rule -a Brave-browser:crx_cifhbcnohmdccbgoicgdjpfamggdegmo desktop=T
bspc rule -a Brave-browser:crx_bkdiakkpagfhaafbmaikhaancfkmejkj desktop=E

# class from xprop: 2nd:1st
while read -r class; do
	bspc rule -a "$class" state=floating
done <<EOF
Arandr
Hdajackretask
KeePassXC
Mojosetup
mpv
Pavucontrol
Pidgin
Qalculate-gtk
qv4l2
scummvm
Seafile Client
Signal
Ted
thunderbird:Mailnews
thunderbird:Msgcompose
Virt-manager
Yad
zenity
EOF
