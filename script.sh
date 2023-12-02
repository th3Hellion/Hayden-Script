#!/bin/bash

building(){

compile(){
  mkdir build
  cd build
  cmake ..
  make
  cp *.uf2 ~/Volumes/Pico
  cd ..
  echo "Opening minicom..."
  sleep 2 #Waiting for Pico to disconnect
  screen /dev/tty.usb* #minicom or putty also works
}
openscreen(){
  cp *.uf2 ~/Volumes/Pico
  echo "Opening minicom..."
  sleep 2
  screen /dev/tty.usb*
}

if [ -d build/  ]; then
echo "Removing Build Directory"
  cd build/
  cmake ..
  make
  openscreen
  cd ..
else
echo "Creating Build Directory"
  compile
fi
}

fi
