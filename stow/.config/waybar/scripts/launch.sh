#!/bin/bash

killall -9 waybar

waybar &
hyprctl reload
