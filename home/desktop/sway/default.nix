{ config, pkgs, ... }:

{
  imports = [
    ../gammastep.nix
    ../swaylock.nix
    ../swaync.nix
    ../blueman.nix
    ../pipewire.nix
    ../waybar.nix
    ../wayvnc.nix
    ../terminal/wezterm
    ../terminal/foot
  ];

  wayland.windowManager.sway = {
    enable = true;
    package = config.lib.nixGL.wrap pkgs.sway;
    config = null;
    extraConfig = builtins.readFile ./config;
  };

  home.packages = with pkgs; [
    swww
    wlogout
    swayidle
    grim
    slurp
    wl-clipboard
    tofi
  ];

  home.file = {
    ".config/swayidle" = {
      source = ../../../.config/swayidle;
      recursive = true;
    };
    ".config/tofi" = {
      source = ../../../.config/tofi;
      recursive = true;
    };
  };
}
