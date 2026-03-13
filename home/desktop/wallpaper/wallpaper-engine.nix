{ inputs, pkgs, ... }:

{
  home.packages = [
    pkgs.linux-wallpaperengine
    inputs.linux-wallpaper-engine.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];
}
