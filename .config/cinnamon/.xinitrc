# vim:ft=sh

xrdb -merge "$XDG_CONFIG_HOME/xorg/Xresources"
setxkbmap -option caps:escape

exec cinnamon-session
