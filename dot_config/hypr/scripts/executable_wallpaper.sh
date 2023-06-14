#!/bin/sh
wallpaper_folder=${HOME}/wallpapers
wallpaper_path=$(ls -d ${wallpaper_folder}/* | wofi -d)
echo ${wallpaper_path}
swww img ${wallpaper_path}
