{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ../brightness.nix
    ../vnc
    ../pipewire.nix
    ../waybar
    ../terminal/wezterm
    ../terminal/foot.nix
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
    hyprlock.enable = true;
  };
  services = {
    swaync.enable = true;
  };
}
