#!/bin/bash

building(){

compile(){
  mkdir build
  cd build
  cmake ..
  make
  cp *.uf2 ~/Desktop #Change ~/Desktop to pico path /Volumes/Pico to autoload after compiling
  cd ..
  echo "Opening minicom..."
  sleep 3 #Waiting for Pico to disconnect
  minicom /dev/tty.usb* #Replace with Screen for mac
}
openscreen(){
  cp *.uf2 ~/Desktop
  echo "Opening minicom..."
  sleep 2.5
  screen /dev/tty.usb*
}

if [ -d build/  ]; then
echo "Removing Build Directory"
  cd build/
  cmake ..
  make
  openscreen
else
echo "Creating Build Directory"
  compile
fi
}

if [ $# -eq 0 ]
  then
    building
else
echo "Anime Girl Incoming!"
echo "閑けさや　岩にしみいる　蝉の声"
open https://randomforme.com/anime_girl

fi
