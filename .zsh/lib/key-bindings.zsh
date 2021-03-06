#
# This is an extended numeric pad keys mapping when <num_lock> is unset.
# The last are combination of <Right_S>|<Right_C>+<Left>|<Up>|<Right>|<Down>
#
# $Header: $HOME/.zsh/lib/key-bindings.zsh              Exp $
# $Aythor: (c) 2011-014 -tclover <tokiclover@gmail.com> Exp $
# $License: MIT (or 2-clause/new/simplified BSD)        Exp $
# $Version: 2014/10/10 21:09:26                         Exp $
#

bindkey -s '\EOa' '\C-[A'
bindkey -s '\EOb' '\C-[B'
bindkey -s '\EOc' '\C-[C'
bindkey -s '\EOd' '\C-[D'

autoload -Uz copy-earlier-word
zle -N copy-earlier-word

for keymap in 'emacs' 'viins'; do
	bindkey -M "$keymap" "\EOw" beginning-of-line
	bindkey -M "$keymap" "\EOq" end-of-line
	bindkey -M "$keymap" "\EOt" backward-char
	bindkey -M "$keymap" "\EOv" forward-char

	bindkey -M "$keymap" "\EOr" down-line-or-history
	bindkey -M "$keymap" "\EOs" end-of-history
	bindkey -M "$keymap" "\EOx" up-line-or-history
	bindkey -M "$keymap" "\EOy" beginning-of-history

	bindkey -M "$keymap" "\EOn" backward-delete-char
	bindkey -M "$keymap" "\EOp" vi-cmd-mode
	bindkey -M "$keymap" "\EOu" delete-char
	bindkey -M "$keymap" "\EOM" accept-line

	bindkey -M "$keymap" "\E[a" copy-earlier-word
	bindkey -M "$keymap" "\E[b" backward-kill-line
	bindkey -M "$keymap" "\E[c" backward-kill-word
	bindkey -M "$keymap" "\E[d" kill-word
	bindkey -M "$keymap" "\C[A" undo
	bindkey -M "$keymap" "\C[B" redo
	bindkey -M "$keymap" "\C[C" forward-word
	bindkey -M "$keymap" "\C[D" backward-word
done
unset keymap

if (( $+DISPLAY )); then
	function print-screen {
		import -window root ~/shot-$(date '+%Y-%m-%d-%H-%M-%S').png
	}
	function run-term { urxvtc }
else
	function print-screen {
		fbgrab -c $TTY -z 9 ~/shot-$(date '+%Y-%m-%d-%H-%M-%S').png
	}
	function run-term { screen }
fi

zle -N run-term
bindkey "$terminfo[kf12]" run-term

zle -N print-screen
bindkey "$terminfo[kf11]" print-screen

#
# vim:fenc=utf-8:tw=80:sw=2:sts=2:ts=2:
#
