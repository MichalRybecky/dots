# If not running interactively, don't do anything
[[ $- != *i* ]] && return
export EDITOR=/usr/bin/vim

#-------------------------- basic ---------------------------
													  alias \
		e='exit'											\
		q='exit'											\
		s='subl'											\
		r='ranger'											\
		p='python'											\
		v='vim'												\
		zr='zaread'											\
		cp='cp -iv'											\
		mv='mv -iv'											\
		rm='rm -iv'											\
		ls='logo-ls'										\
		la='logo-ls -A'										\
		ll='logo-ls -al'									\
		z='zathura --fork'									\
		sc='cd $HOME/sync/school/'							\
		zathura='zathura --fork'							\
		neofetch='neofetch --ascii \
			$HOME/.config/neofetch/small_arch'		


#--------------------------- dev ----------------------------
													  alias \
		g='g++ -Wall -std=c++14'							\
		new='alacritty & disown'							\
		ginf='g++ -static -std=gnu++11 -O2 -Wall -Wextra'	\
		inf='cd $HOME/coding/FMFI-INF/'						\
		ssh='TERM=xterm-256color ssh'						\
		ssh='TERM=xterm-256color ssh'						\
		pirp='pipenv --python /usr/bin/python3'				\
		gitcred='git config credential.helper store'		\
		dots='/usr/bin/git \
			--git-dir=$HOME/.config/dotfiles \
			--work-tree=$HOME'								


#---------------------- productivity ------------------------
													  alias \
		tt='taskwarrior-tui'								\
		timetable='zathura \
			$HOME/sync/school/rozvrh-1inf2.pdf && exit'	\
		vw='vim $HOME/sync/wiki/index.wiki'					\
		vb='librewolf $HOME/sync/wiki/.html/index.html'		\
		fin='$HOME/.config/Portfolio-updater/run.sh \
			& disown ; exit'								\
		cal='vdirsyncer sync && \
			ikhal && vdirsyncer sync \
			&& clear'										\
		weather='curl -s wttr.in/bratislava \
			| head -n 37'


#------------------------- system ---------------------------
													  alias \
	bm='bashmount'											\
	backup-native-packages='pacman -Qqen > \
		$HOME/sync/tech/pkglist.txt'						\
	backup-aur-packages='pacman -Qqem > \
		$HOME/sync/tech/aurlist.txt'						\
	check-usb='sudo badblocks -w -s -o usb-error.log'		\
	list-packages='pacman -Qet | awk "{print $1}"'			\
	resolve='/opt/resolve/bin/resolve & disown ; exit'		\
	update-mirrorlist='sudo reflector \
		--latest 20 --protocol https \
		--sort rate --save /etc/pacman.d/mirrorlist'


#---------------------------------------------------

# Unsetting env variables for shell
# without this, ranger UI breaks (Qtile specific)
unset LINES
unset COLUMNS

# cd to dir only by typing it's name
shopt -s autocd

# Load Nord color theme dir_colors
test -r "~/.dir_colors" && eval $(dircolors ~/.dir_colors)

# Different bash prompt for user and root
if [ "$EUID" -ne 0 ]
	then export PS1="\[$(tput setaf 6)\]\[$(tput setaf 6)\] \w \[$(tput sgr0)\]"
	
	else export PS1="\[$(tput setaf 5)\]root \[$(tput setaf 6)\]\[$(tput setaf 6)\] \w \[$(tput sgr0)\]"
fi


# this big boi of an alias did not fit into that neat little alias widget up there lol
alias update-origin='cd /mnt/HDD/Games/origin/drive_c/Program\ Files\ \(x86\)/Origin ; ./updateorigin.sh ; cd'
