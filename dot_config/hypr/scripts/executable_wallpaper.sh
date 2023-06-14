#!/bin/sh
wallpaper_folder=${HOME}/wallpapers
wallpaper=$(ls ${wallpaper_folder} | wofi -d)
swww img --transition-type any --transition-fps 60 ${wallpaper_folder}/${wallpaper}
