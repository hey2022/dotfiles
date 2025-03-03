{
  inputs,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./settings.nix
    ./binds.nix
    ./rules.nix
    ./plugins
    ../stylix.nix
    ../brightness.nix
    ./hypridle.nix
    ./hyprpanel.nix
    ../hyprlock.nix
    ../swaync.nix
    ../vnc
    ../pipewire.nix
    ../wlogout.nix
    ../terminal/foot.nix
    ../file-manager/pcmanfm.nix
    ../launchers/fuzzel.nix
    ../../programs/music.nix
    ../../dev/jq.nix
    ../swww
    ../wayland
  ];
  options = {
    wayland.windowManager.hyprland.hy3 = lib.mkEnableOption "hy3";
  };
  config = {
    wayland.windowManager.hyprland = {
      enable = true;
      package = inputs.hyprland.packages.${pkgs.system}.hyprland;
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
