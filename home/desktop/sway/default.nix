{
  config,
  lib,
  pkgs,
  ...
}:
{
  imports = [
    ../vnc
    ./wkill.nix
    ../file-manager/pcmanfm.nix
    ../wayland
  ];

  wayvnc.enable = true;
  wayland.windowManager.sway = {
    enable = true;
    package = config.lib.nixGL.wrap pkgs.sway;
    config = lib.mkForce null;
    extraConfig = builtins.readFile ./config;
  };
  programs = {
    foot.enable = true;
    fuzzel.enable = true;
    hyprlock.enable = true;
    waybar.enable = true;
    wezterm.enable = true;
  };
  services = {
    gammastep.enable = true;
    swaync.enable = true;
  };
}
