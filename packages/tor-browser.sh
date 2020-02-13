#!/bin/bash
cd $1/temp
name="tor-browser" 
wget https://www.torproject.org/dist/torbrowser/9.0.4/tor-browser-linux64-9.0.4_en-US.tar.xz -O 1.tar.xz
tar xf 1.tar.xz
mkdir ../$name
cp -r tor-browser_en-US/* ../$name/
sudo ln -s ../$name/start-tor-browser.desktop /usr/bin/$name

