#!/bin/sh

FONT="FiraCodeNerdFont Mono Regular 18 @wght=400" 

wmenu -i -f "$FONT" \
    "$@" \
    -n f4f4f4ff \
    -N 00000022 \
    -M f4f4f4ff \
    -m 111111ff \
    -S f4f4f4ff \
    -s 111111ff 
