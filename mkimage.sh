#!/bin/sh

# config
PROFILE="TLWR1043"
PACKAGELIST=$(cat packagelist.txt | grep -v '#' | tr -s '\n' ' ')


# download image builder for the ar71xx platform
if [ -s OpenWrt-ImageBuilder-15.05-ar71xx-generic.Linux-x86_64.tar.bz2 ]; then
    echo "image builder already downloaded do not download it again"
else
    wget http://downloads.openwrt.org/chaos_calmer/15.05/ar71xx/generic/OpenWrt-ImageBuilder-15.05-ar71xx-generic.Linux-x86_64.tar.bz2
    echo "image builder downloaded"
fi

if [ -s OpenWrt-ImageBuilder-15.05-ar71xx-generic.Linux-x86_64 ]; then
    echo "image builder already unpacked do not unpack it again"
else
    tar xjf OpenWrt-ImageBuilder-15.05-ar71xx-generic.Linux-x86_64.tar.bz2
    echo "image builder unpacked"
fi

cd OpenWrt-ImageBuilder-15.05-ar71xx-generic.Linux-x86_64
make clean
make image PROFILE="$PROFILE" PACKAGES="$PACKAGELIST" FILES=../files
