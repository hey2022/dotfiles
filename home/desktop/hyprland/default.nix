{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./settings.nix
    ./binds.nix
    ./rules.nix
    ../stylix.nix
    ../brightness.nix
    ../hyprlock.nix
    ../swaync.nix
    ../vnc
    ../pipewire.nix
    ../waybar
    ../wlogout.nix
    ../terminal/foot.nix
    ../file-manager/pcmanfm.nix
    ../launchers/rofi
    ../../programs/music.nix
    ../../dev/jq.nix
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
