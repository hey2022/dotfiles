{
  config,
  lib,
  pkgs,
  ...
}:

{
  imports = [
    ../gammastep.nix
    ../swaylock.nix
    ../swaync.nix
    ../vnc
    ../pipewire.nix
    ../waybar.nix
    ../terminal/wezterm
    ../terminal/foot.nix
    ../stylix.nix
    ./wkill.nix
  ];

  wayvnc.enable = true;
  wayland.windowManager.sway = {
    enable = true;
    package = config.lib.nixGL.wrap pkgs.sway;
    config = lib.mkForce null;
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
