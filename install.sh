#!/usr/bin/env bash
cp config.def.h config.h && sudo make clean install && sudo pkill -u $USER
