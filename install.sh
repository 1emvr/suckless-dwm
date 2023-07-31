#!/usr/bin/env bash
cp configs/.xinitrc ~
cp configs/.zshrc ~

cp -r kitty ~/.configs/
cp -r nvim ~/.configs/

cp config.def.h config.h && sudo make clean install && sudo pkill -u $USER