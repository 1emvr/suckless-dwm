#!/usr/bin/env bash
cp configs/.xinitrc ~
cp configs/.zshrc ~

cp -r configs/kitty ~/.configs/
cp -r configs/nvim ~/.configs/

cp config.def.h config.h && sudo make clean install && sudo pkill -u $USER
