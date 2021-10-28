#
# ~/.bash_profile
#

XCURSOR_THEME=Bibata-Original-Classic

[[ -f ~/.bashrc ]] && . ~/.bashrc

# Startx if not already running on TTY1
if [[ "$(tty)" = "/dev/tty1" ]]; then
	pgrep -x qtile || exec startx
fi

