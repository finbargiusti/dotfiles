#!/bin/sh

FONT="FiraCodeNerdFont Mono Regular 18 @wght=400" 

wmenu -i -f "$FONT" \
    "$@" \
    -n 00ff00 \
    -N 000000 \
    -M 00ff00 \
    -m 000000 \
    -S 00ff00 \
    -s 000000
