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
    ../file-manager/cosmic-files.nix
    ../launchers/fuzzel.nix
    ../vnc
    ../waybar
    ../wayland
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
    ];
    home.sessionVariables.NIXOS_OZONE_WL = "1";
    programs = {
      ghostty.enable = true;
      hyprlock.enable = true;
      wlogout.enable = true;
    };
    services = {
      swaync.enable = true;
    };
  };
}
