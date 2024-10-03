{ config, pkgs, ... }:

{
  imports = [
    ./swaync.nix
    ./blueman.nix
    ./pipewire.nix
    ./waybar.nix
    ./terminal/foot
  ];
  home.packages = with pkgs; [
    sway
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
  };
}
