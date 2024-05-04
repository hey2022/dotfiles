#!/usr/bin/env sh

wallpaper_folder=$HOME/wallpapers
wallpaper_path=$wallpaper_folder/$(ls $wallpaper_folder | tofi)
swww img --transition-type any --transition-fps 60 $wallpaper_path
