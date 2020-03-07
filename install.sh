#!/bin/bash
# AUR installer
workdir="`pwd`/`dirname $0`"
sudo pacman -S git --needed
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm

# detect super user command
super_user=""
if ! [ -x "$(command -v sudo)" ]; then
	super_user="${super_user}doas"
else	
	super_user="${super_user}sudo"
fi

# if root already don't use sudo
if [ "`whoami`" = "root" ] ; then
	echo -e "\e[91mWarning: yay and packages from it will not be installed as root!\e[0m"
	"${workdir}"/arch-gaming.sh
fi
${super_user} "${workdir}"/arch-gaming.sh
