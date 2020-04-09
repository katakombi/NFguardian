#!/bin/sh

# config
PROFILE="tplink_tl-wr1043nd-v1"
PACKAGES=$(cat packagelist.txt | grep -v '#' | tr -s '\n' ' ')
FILES="$PWD/files"

# download image builder for the ar71xx platform
if [ -s openwrt-imagebuilder-19.07.2-ath79-generic.Linux-x86_64.tar.xz ]; then
    echo "image builder already downloaded do not download it again"
else
    wget https://downloads.openwrt.org/releases/19.07.2/targets/ath79/generic/openwrt-imagebuilder-19.07.2-ath79-generic.Linux-x86_64.tar.xz
    echo "image builder downloaded"
fi

if [ -s openwrt-imagebuilder-19.07.2-ath79-generic.Linux-x86_64 ]; then
    echo "image builder already unpacked do not unpack it again"
else
    tar -xf OpenWrt-ImageBuilder-15.05.1-ar71xx-generic.Linux-x86_64.tar.bz2
    echo "image builder unpacked"
fi

cd openwrt-imagebuilder-19.07.2-ath79-generic.Linux-x86_64
make clean
make image PROFILE="$PROFILE" PACKAGES="$PACKAGES" FILES="$FILES" BIN_DIR="$PWD/.."
