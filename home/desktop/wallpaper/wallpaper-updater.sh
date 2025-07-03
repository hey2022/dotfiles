#!/usr/bin/env sh

wallpaper_dir="$HOME/wallpapers"
wallpaper_url='https://github.com/D3Ext/aesthetic-wallpapers'
mkdir -p "$wallpaper_dir"
if [ -d "$wallpaper_dir/.git" ]; then
    cd "$wallpaper_dir" || exit
    git pull
else
    rm -rf "${wallpaper_dir:?}/*"
    git clone "$wallpaper_url.git" "$wallpaper_dir" --depth 1
fi
