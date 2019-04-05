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
		ffmpeg -i "$i" -codec copy "${i%.*}.mp4"
		rm -rf "${i%.*}.mkv"
	done
elif [ "$1" == "aria" ]; then 

 $(chromium ~/Applications/webui-aria2-master/docs/index.html)
 $(aria2c --enable-rpc --rpc-listen-all)
fi


