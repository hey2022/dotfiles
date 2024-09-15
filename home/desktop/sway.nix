{ config, pkgs, ... }:

{
  imports = [ ./swaync.nix ];
  home.packages = with pkgs; [
    sway
    waybar
    swww
    foot
    wlogout
    swaylock
    swayidle
    grim
    slurp
    wl-clipboard
    tofi
  ];

  home.file = {
    ".config/foot" = {
      source = ../../.config/foot;
      recursive = true;
    };
    ".config/gammastep" = {
      source = ../../.config/gammastep;
      recursive = true;
    };
    ".config/sway" = {
      source = ../../.config/sway;
      recursive = true;
    };
    ".config/swayidle" = {
      source = ../../.config/swayidle;
      recursive = true;
    };
    ".config/swaylock" = {
      source = ../../.config/swaylock;
      recursive = true;
    };
    ".config/tofi" = {
      source = ../../.config/tofi;
      recursive = true;
    };
    ".config/waybar" = {
      source = ../../.config/waybar;
      recursive = true;
    };
  };
}
