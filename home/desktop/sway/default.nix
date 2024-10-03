{ config, pkgs, ... }:

{
  imports = [
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
    swaylock
    swayidle
    grim
    slurp
    wl-clipboard
    tofi
  ];

  home.file = {
    ".config/gammastep" = {
      source = ../../../.config/gammastep;
      recursive = true;
    };
    ".config/swayidle" = {
      source = ../../../.config/swayidle;
      recursive = true;
    };
    ".config/swaylock" = {
      source = ../../../.config/swaylock;
      recursive = true;
    };
    ".config/tofi" = {
      source = ../../../.config/tofi;
      recursive = true;
    };
  };
}
