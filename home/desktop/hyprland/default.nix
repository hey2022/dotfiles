{
  inputs,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ../../dev/jq.nix
    ../../programs/music.nix
    ../brightness.nix
    ../file-manager/dolphin.nix
    ../hyprlock
    ../launchers/fuzzel.nix
    ../pipewire.nix
    ../swaync.nix
    ../terminal/ghostty.nix
    ../vnc
    ../waybar
    ../wayland
    ../wlogout.nix
    ./binds.nix
    ./hypridle.nix
    ./plugins
    ./rules.nix
    ./settings.nix
  ];
  options = {
    wayland.windowManager.hyprland.hy3 = lib.mkEnableOption "hy3";
  };
  config = {
    wayland.windowManager.hyprland = {
      enable = true;
      systemd.enable = false;
      hy3 = true;
    };
    home.packages = [
      inputs.hyprland-contrib.packages.${pkgs.system}.grimblast
      pkgs.mullvad
    ];
    home.sessionVariables.NIXOS_OZONE_WL = "1";
  };
}
