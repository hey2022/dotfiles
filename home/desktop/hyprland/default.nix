{
  inputs,
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.wayland.windowManager.hyprland;
in
{
  imports = [
    ../../dev/jq.nix
    ../../programs/music.nix
    ../file-manager/cosmic-files.nix
    ../vnc
    ../wayland
    ./binds.nix
    ./hypridle.nix
    ./hyprlock
    ./plugins
    ./rules.nix
    ./settings.nix
    ./startup.nix
  ];
  options = {
    wayland.windowManager.hyprland = {
      hy3 = lib.mkEnableOption "hy3";
      uwsm = lib.mkEnableOption "uwsm";
      term = lib.mkPackageOption pkgs "terminal" {
        default = "kitty";
      };
    };
  };
  config = {
    wayland.windowManager.hyprland = {
      enable = true;
      systemd.enable = false;
      hy3 = true;
      uwsm = true;
      term = config.programs.ghostty.package;
    };
    home.packages = [
      inputs.hyprland-contrib.packages.${pkgs.system}.grimblast
    ] ++ lib.optionals cfg.uwsm [ pkgs.uwsm ];
    programs = {
      rofi.enable = true;
      ghostty.enable = true;
      hyprlock.enable = true;
      waybar.enable = true;
      wlogout.enable = true;
    };
    services = {
      cliphist.enable = true;
      gammastep.enable = true;
      hypridle.enable = true;
      swaync.enable = true;
    };
  };
}
