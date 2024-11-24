{
  config,
  lib,
  pkgs,
  ...
}: {
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
    ../file-manager/dolphin.nix
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
    wl-clipboard
    tofi
    playerctl
  ];

  home.file = {
    ".config/tofi" = {
      source = ../../../.config/tofi;
      recursive = true;
    };
  };
}
