{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ../brightness.nix
    ../vnc
    ./wkill.nix
    ../file-manager/pcmanfm.nix
    ../launchers/fuzzel.nix
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
    hyprlock.enable = true;
    waybar.enable = true;
    wezterm.enable = true;
  };
  services = {
    swaync.enable = true;
  };
}
