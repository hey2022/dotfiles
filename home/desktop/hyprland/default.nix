{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./settings.nix
    ./binds.nix
    ../brightness.nix
    ../hyprlock.nix
    ../swaync.nix
    ../vnc
    ../pipewire.nix
    ../waybar.nix
    ../terminal/wezterm
    ../stylix.nix
    ../file-manager/dolphin.nix
  ];
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = false;
  };
  home.packages = [
    inputs.hyprland-contrib.packages.${pkgs.system}.grimblast
  ];
  home.sessionVariables.NIXOS_OZONE_WL = "1";
}
