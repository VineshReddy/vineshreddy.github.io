#!/bin/bash

sudo pacman -Syu broadcom-wl wpa_supplicant  dialog  netctl wpa_actiond bluez bluez-utils  pulseaudio-bluetooth libinput
sudo pacman -S xorg-server xorg-xinit openbox 
sudo pacman -S light xterm git gvim tmux ranger dmenu xorg-xkill numlockx redshift xclip 
sudo pacman -S chromium w3m aria2 youtube-dl mps-youtube gpicview weechat
sudo pacman -S atool bzip2 cpio gzip lha xz lzop p7zip tar unace unrar zip unzip
sudo pacman -S ttf-opensans ttf-dejavu ttf-liberation noto-fonts
#sudo pacman -S ntfs-3g mtpfs android-tools
sudo pacman -S jre-openjdk apache lua npm nodejs
#sudo pacman -S pavucontrol lxrandr fuse ffmpeg ffmpegthumbnailer
#lxrandr for hdmi , fuse for appimage
#sudo pacman -S kdenlive, blender, gimp, krita, inkscape, audacity, virtualbox, okular

sudo ln -s /etc/fonts/conf.avail/70-no-bitmaps.conf /etc/fonts/conf.d
sudo ln -s /etc/fonts/conf.avail/10-sub-pixel-rgb.conf /etc/fonts/conf.d
sudo ln -s /etc/fonts/conf.avail/11-lcdfilter-default.conf /etc/fonts/conf.d
sudo bash -c 'echo "export FREETYPE_PROPERTIES="truetype:interpreter-version=40"" >> /etc/profile.d/freetype2.sh'
sudo cp local.conf /etc/fonts/

#sudo systemctl enable netctl-auto@wlp6s0.service
#sudo systemctl enable bluetooth.service

mkdir ~/{.config,.vim}/

ln -sf ~/vineshreddy.github.io/Linux/Configuration/.Xmodmap ~/.Xmodmap
ln -sf ~/vineshreddy.github.io/Linux/Configuration/autoconf.sh ~/autoconf.sh
ln -sf ~/vineshreddy.github.io/Linux/Configuration/.bashrc ~/.bashrc
ln -sf ~/vineshreddy.github.io/Linux/Configuration/.inputrc ~/.inputrc
ln -sf ~/vineshreddy.github.io/Linux/Configuration/.tmux.conf ~/.tmux.conf 
ln -sf ~/vineshreddy.github.io/Linux/Configuration/.vimrc ~/.vimrc
ln -sf ~/vineshreddy.github.io/Linux/Configuration/.xinitrc ~/.xinitrc
ln -sf ~/vineshreddy.github.io/Linux/Configuration/.Xresources ~/.Xresources
ln -sf ~/vineshreddy.github.io/Linux/Configuration/.bind.sh ~/.bind.sh
ln -sf ~/vineshreddy.github.io/Linux/Configuration/.config/openbox ~/.config/openbox
ln -sf ~/vineshreddy.github.io/Linux/Configuration/.config/ranger ~/.config/ranger


echo "Symbolics created.";

mkdir ~/Applications ~/Downloads 
mkdir ~/.vim/{swap,backup,undo}



sudo mv /lib/firmware/brcm/BCM.hcd ~/Backup/
sudo cp BCM43142A0-0a5c-21d7.hcd /lib/firmware/brcm/

sudo cp touchpad.conf  /etc/X11/xorg.conf.d/


git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm



#/etc/fstab
#ln -s /mnt/sda4 /home/vinesh/.drive
#permissions

#npm global install path
npm config set prefix '~/Applications/.npm'


#git clone https://github.com/ziahamza/webui-aria2 ~/Applications/
