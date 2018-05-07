#!/usr/bin/env bash

go get github.com/SRI-CSL/gllvm/cmd/...

cd ${HOME}
wget https://cdn.kernel.org/pub/linux/kernel/v4.x/linux-4.14.39.tar.xz
tar xvf linux-4.14.39.tar.xz
cd linux-4.14.39

cp /vagrant/tinyconfig64 .config

make CC=gclang HOSTCC=gclang

get-bc -m -b built-in.o
get-bc -m vmlinux