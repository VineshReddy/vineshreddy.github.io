#!/bin/bash


if [ "$1" == "redshift" ]; then
 checkProcess="$(pgrep redshift | wc -l)"
 if [ $checkProcess != 1 ];
 then
  $(redshift)
 else
  $(pkill "redshift")
 fi
elif [ "$1" == "bluetooth" ]; then
 $(echo "power on" | bluetoothctl)
 $(echo "connect F4:4E:FD:C7:D9:EE" | bluetoothctl)

elif [ "$1" == "convertvideos" ]; then
 for i in *.mkv; do
  (ffmpeg -i "$i" -codec copy "${i%.*}.mp4")
  rm -rf "${i%.*}.mkv"
 done
elif [ "$1" == "init" ]; then
 sudo mount -o rw /dev/sda5 home/vinesh/drive #================> Change manual mount
 if [ ! -e "/.swap" ]; then
  dd if=/dev/zero of=/.swap bs=2048 count=1M
  fi
  mkswap /.swap
  swapon /.swap
  if [ $(command -v yandex-disk) ]; then
   systemctl --user start yandex-disk.service
  fi
  if [ "$2" == "vbox" ]; then
   sudo mount -t vboxsf shared shared
   VBoxClient-all
  fi

 else
  ext_ip=$(ip -4 addr | grep -oP '(?<=inet\s)\d+(\.\d+){3' | tail -n1)
  fbport=8000
 
 if [ "$1" == "gotty" ]; then
  gotty -w tmux

 elif [ "$1" == "aria" ]; then
  echo "http://$ext_ip/Applications/webui-aria2-master/docs/index.html"
  (cd ~/Downloads && exec aria2c --enable-rpc --rpc-listen-all )
  if [ "$2" == "y" ]; then
   chromium ~/Applications/webui-aria2-master/docs/index.html
  fi

 elif [ "$1" == "filebrowser" ]; then
  echo "http://$ext_ip:$fbport/"
  (cd ~/Applications && exec filebrowser -r ~/  -a 0.0.0.0 -p $fbport )
 fi
fi
