{ lib, ... }:

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
