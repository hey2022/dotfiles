#!/usr/bin/env bash

DEFAULT_WALLPAPER_FOLDER="$HOME/.dotfiles/wallpapers"
wallpaper_folder="${1:-$DEFAULT_WALLPAPER_FOLDER}"
if [[ ! -d "$wallpaper_folder" ]]; then
    echo "Error: Directory '$wallpaper_folder' does not exist."
    exit 1
fi

wallpaper="$wallpaper_folder/$(fd -t f --base-directory "$wallpaper_folder" | fuzzel -d)"
if [[ -n "$wallpaper" ]]; then
    swww img -t any --transition-fps 120 "$wallpaper"
fi
