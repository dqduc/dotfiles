#
# $Header: ~/.xinitrc, 2015/03/30 15:32:37 -tclover Exp $
#

gcm-session &

if [ -r $TMPDIR/env ]; then
	while read line; do
		export $line
	done <$TMPDIR/env
else
	eval export $(gpg-agent --daemon --sh)
	eval export $(ssh-agent -s)
	{
		echo GPG_AGENT_INFO=$GPG_AGENT_INFO
		echo SSH_AUTH_SOCK=$SSH_AUTH_SOCK
		echo SSH_AGENT_PID=$SSH_AGENT_PID
	} >$TMPDIR/env
fi

xset s off
xset fp+ /usr/share/fonts/artwiz-latin1
xset fp+ /usr/share/fonts/terminus
xset fp rehash

[ -s ~/.Xresources ] && xrdb -load ~/.Xresources
#setxkbmap -model pc105 -layout fr -variant ,oss,latin9,oss_latin9 \
#	-option grp:shift_caps_toggle,keypad:future,terminate:ctrl_alt_bksp
#[ -s ~/.Xdefaults ] && xrdb -merge ~/.Xdefaults
[ -s ~/.Xmodmap ] && xmodmap ~/.Xmodmap
#[ -s ~/.color/x/sj-bright ] && xrdb -merge ~/.color/x/sj-bright
#[ -s ~/.color/icc/sRGB_v4_ICC_preference_displayclass.icc ] &&

#xautolock -time 30 -locker slock
xbacklight -set 20
#xcalib -gc 1.0 -b 0.0 -co 100.0 ~/.color/icc/sRGB_v4_ICC_preference_displayclass.icc

unclutter -idle 8 -noevents &
dhcpcd-gtk >/dev/null 2>&1 &
ladi-system-tray > ~/.log/ladi/ladi.log 2>&1 &
urxvtd -q -o -f &

case $(tty | cut -b9-) in
	(1) exec enlightenment_start;;
	(2) exec icewm-session      ;;
	(3) exec openbox-session    ;;
esac

#
# vim:fenc=utf-8:ft=sh:ci:pi:sts=2:sw=2:ts=2:
#
