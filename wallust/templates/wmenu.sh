#!/bin/sh

FONT="FiraCodeNerdFont Mono Regular 18 @wght=400" 

wmenu -i -f "$FONT" \
    "$@" \
    -n {{ color5 | lighten(0.3) | strip }}FF \
    -N {{ background | strip }}{{ alpha | alpha_hexa }} \
    -M {{ color5 | lighten(0.3) | strip }}FF \
    -m {{ background | strip }}FF \
    -S {{ color5 | lighten(0.3) | strip }}FF \
    -s {{ background | strip }}FF
