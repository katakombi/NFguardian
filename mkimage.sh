#!/bin/sh

# config
PROFILE="Caiman"
PACKAGES=$(cat packagelist.txt | grep -v '#' | tr -s '\n' ' ')
FILES="$PWD/files"


# download image builder for the mvebu platform
if [ -s OpenWrt-ImageBuilder-15.05.1-mvebu.Linux-x86_64.tar.bz2 ]; then
    echo "image builder already downloaded do not download it again"
else
    wget https://downloads.openwrt.org/chaos_calmer/15.05.1/mvebu/generic/OpenWrt-ImageBuilder-15.05.1-mvebu.Linux-x86_64.tar.bz2
    echo "image builder downloaded"
fi

if [ -s OpenWrt-ImageBuilder-15.05.1-mvebu.Linux-x86_64 ]; then
    echo "image builder already unpacked do not unpack it again"
else
    tar xjf OpenWrt-ImageBuilder-15.05.1-mvebu.Linux-x86_64.tar.bz2
    echo "image builder unpacked"
fi

cd OpenWrt-ImageBuilder-15.05.1-mvebu.Linux-x86_64
make clean
make image PROFILE="$PROFILE" PACKAGES="$PACKAGES" FILES="$FILES"
