#!/bin/sh
wallpaper_folder=${HOME}/wallpapers
wallpaper_path=$(ls -d ${wallpaper_folder}/* | wofi -d)
echo ${wallpaper_path}
swww img --transition-type any --transition-fps 60 ${wallpaper_path}
