#!/bin/bash

sudo pacman -Syu xorg-server xorg-xinit openbox samba
sudo pacman -S light xterm git gvim tmux ranger dmenu xorg-xkill numlockx redshift xclip wget  
sudo pacman -S  aria2 youtube-dl mps-youtube weechat 
sudo pacman -S atool bzip2 cpio gzip lha xz lzop p7zip tar unace unrar zip unzip
sudo pacman -S ttf-opensans ttf-dejavu ttf-liberation noto-fonts
sudo pacman -S jre-openjdk apache lua npm nodejs
sudo pacman -S lxrandr fuse ffmpeg ffmpegthumbnailer
#lxrandr for hdmi , fuse for appimage
#sudo pacman -S kdenlive, blender, gimp, krita, inkscape, audacity, virtualbox, okular
sudo pacman -S weechat python2 ruby guile aspell


sudo ln -s /etc/fonts/conf.avail/70-no-bitmaps.conf /etc/fonts/conf.d
sudo ln -s /etc/fonts/conf.avail/10-sub-pixel-rgb.conf /etc/fonts/conf.d
sudo ln -s /etc/fonts/conf.avail/11-lcdfilter-default.conf /etc/fonts/conf.d
sudo bash -c 'echo "export FREETYPE_PROPERTIES="truetype:interpreter-version=40"" >> /etc/profile.d/freetype2.sh'
sudo cp local.conf /etc/fonts/

if [ "$1" == "x64" ]; then
	
	sudo pacman -S ntfs-3g mtpfs android-tools
	sudo pacman -S broadcom-wl-dkms wpa_supplicant  dialog  netctl bluez bluez-utils  pulseaudio-bluetooth libinput #wpa_actiond
	sudo rmmod b43 b43legacy bcm43xx bcma brcm80211 brcmfmac brcmsmac ssb wl
	sudo modprobe wl
	sudo pacman -S chromium pavucontrol gpicview 
	#sudo systemctl enable netctl-auto@wlp6s0.service bluetooth.service
	sudo mv /lib/firmware/brcm/BCM.hcd ~/.Trash/
	sudo cp BCM43142A0-0a5c-21d7.hcd /lib/firmware/brcm/
fi


if [ "$1" == "arm64" ]; then
	sudo pacman -Syu gcc libinput 
	#enable sysv init https://github.com/smaknsk/servicectl

fi


sudo curl "https://git.samba.org/samba.git/?p=samba.git;a=blob_plain;f=examples/smb.conf.default;hb=HEAD" -o /etc/samba/smb.conf
sudo smbpasswd -a vinesh


mkdir -p ~/Applications/bin ~/Downloads ~/{.config,.vim}/ ~/.vim/{swap,backup,undo}

ln -sf ~/vineshreddy.github.io/Linux/Configuration/.gitconfig ~/.gitconfig
ln -sf ~/vineshreddy.github.io/Linux/Configuration/.Xmodmap ~/.Xmodmap
ln -sf ~/vineshreddy.github.io/Linux/Configuration/autoconfig.sh ~/autoconfig.sh
ln -sf ~/vineshreddy.github.io/Linux/Configuration/.bashrc ~/.bashrc
ln -sf ~/vineshreddy.github.io/Linux/Configuration/.inputrc ~/.inputrc
ln -sf ~/vineshreddy.github.io/Linux/Configuration/.tmux.conf ~/.tmux.conf 
ln -sf ~/vineshreddy.github.io/Linux/Configuration/.vimrc ~/.vimrc
ln -sf ~/vineshreddy.github.io/Linux/Configuration/.xinitrc ~/.xinitrc
ln -sf ~/vineshreddy.github.io/Linux/Configuration/.Xresources ~/.Xresources
ln -sf ~/vineshreddy.github.io/Linux/Configuration/app ~/app
ln -s ~/vineshreddy.github.io/Linux/Configuration/.config/openbox ~/.config/
ln -s ~/vineshreddy.github.io/Linux/Configuration/.config/ranger ~/.config/


echo "Symbolics created.";

sudo cp touchpad.conf  /etc/X11/xorg.conf.d/

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

#npm global install path
npm config set prefix '~/Applications/.npm'

