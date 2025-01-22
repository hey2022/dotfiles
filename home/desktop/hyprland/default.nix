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
    ../terminal/wezterm
    ../file-manager/pcmanfm.nix
    ../rofi
  ];
  wayland.windowManager.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    systemd.enable = false;
  };
  home.packages = [
    inputs.hyprland-contrib.packages.${pkgs.system}.grimblast
  ];
  home.sessionVariables.NIXOS_OZONE_WL = "1";
}
