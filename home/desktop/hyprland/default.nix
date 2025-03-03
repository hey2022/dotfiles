{
  pkgs,
  inputs,
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
  wayland.windowManager.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    systemd.enable = false;
  };
  home.packages = [
    inputs.hyprland-contrib.packages.${pkgs.system}.grimblast
    pkgs.mullvad
  ];
  home.sessionVariables.NIXOS_OZONE_WL = "1";
}
