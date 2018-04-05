#!/bin/sh

echo $ pacman -Sy
pacman -Sy
echo $ pacman -S --needed --noconfirm msys2-runtime pacman pacman-mirrors
pacman -S --needed --noconfirm msys2-runtime pacman pacman-mirrors
