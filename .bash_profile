#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

# Configure keyboard layouts
# setxkbmap -layout us,sk -variant ,qwerty

# Switch Caps lock andd ESC
# setxkbmap -option caps:swapescape

# Activate numlock
# numlockx

# Change key rate
# xset r rate 300 50

# Merge Xresources
# xrdb -merge ~/.Xresources

# Startx if not already running on TTY1
if [[ "$(tty)" = "/dev/tty1" ]]; then
	pgrep -x qtile || exec startx
fi
