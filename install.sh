#! /bin/bash

# What Linux distro are we on?
OS= sed -n 's/^NAME=//p' /etc/*-release
echo $OS

sudo apt-get install gcc -y
# yum install gcc -y
sudo apt-get install autoconf2.13 bison bzip2 ccache curl flex gawk gcc-4.6 g++-4.6 g++-4.6-multilib git ia32-libs lib32ncurses5-dev lib32z1-dev libgl1-mesa-dev libX11-dev make -y

sudo ln -s /usr/lib/i386-linux-gnu/libX11.so.6 /usr/lib/i386-linux-gnu/libX11.so<br /><br />$ sudo ln -s /usr/lib/i386-linux-gnu/mesa/libGL.so.1 /usr/lib/i386-linux-gnu/libGL.so

sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-4.7 10
update-alternatives: using /usr/bin/gcc-4.7 to provide /usr/bin/gcc (gcc) in auto mode -y
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-4.6 5 -y
sudo update-alternatives --config gcc -y

ccache --max-size 3GB

git clone git://github.com/mozilla-b2g/B2G.git
cd B2G/
./config.sh emulator

git pull
./repo sync
./build.sh
./run-emulator.sh

exit 0


