{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ../brightness.nix
    ../hyprlock.nix
    ../swaync.nix
    ../vnc
    ../pipewire.nix
    ../waybar.nix
    ../terminal/wezterm
    ../terminal/foot.nix
    ./wkill.nix
    ../file-manager/pcmanfm.nix
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
    grim
    slurp
    tesseract
    wl-clipboard
    tofi
    playerctl
    brightnessctl
  ];

  home.file = {
    ".config/tofi" = {
      source = ../../../.config/tofi;
      recursive = true;
    };
  };
}
