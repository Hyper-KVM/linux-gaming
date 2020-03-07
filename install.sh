#!/bin/bash
# AUR installer
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
	sh -c "cd /home/$USER/linux-gaming; ./arch-gaming.sh"
fi
${super_user} -H sh -c "cd /home/$USER/linux-gaming; ./arch-gaming.sh"
