#!/bin/sh

while getopts :p flag
do
    case "${flag}" in
        p) PRISTINE=true;;
        *) echo "Invalid flag"
        exit 1;;
    esac
done

west build -b nice_nano_v2 -s /home/lucas/zmk/app -d build/right ${PRISTINE:+-p} -- -DSHIELD=lily58_right -DZMK_CONFIG="/home/lucas/projects/zmk-config/config"
west build -b nice_nano_v2 -s /home/lucas/zmk/app -d build/left ${PRISTINE:+-p} -- -DSHIELD=lily58_left -DZMK_CONFIG="/home/lucas/projects/zmk-config/config"

mv build/left/zephyr/zmk.uf2 left.uf2
mv build/right/zephyr/zmk.uf2 right.uf2
