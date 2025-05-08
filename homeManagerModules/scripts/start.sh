#!/usr/bin/env bash
if [ "$(tty)" = "/dev/tty1" ]; then
   exec Hyprland &> /dev/null
fi
