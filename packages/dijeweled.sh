#!/bin/bash
cd $1/temp
name="dijeweled" 
wget https://bitbucket.org/LDinos/dijeweled-remastered/downloads/Dijeweled_1.6_Linux.tar.gz -O 1.tar.gz
tar xf 1.tar.gz
mkdir ../$name
cp -r bej_temp_remaster/* ../$name/
sudo ln -s $1/$name/bej_temp_remaster /usr/bin/$name
