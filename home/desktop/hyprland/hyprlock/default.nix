{
  config,
  lib,
  pkgs,
  ...
}:
{
  programs.hyprlock = {
    package = if config.host.isNixOS then pkgs.hyprlock else pkgs.emptyDirectory;
    extraConfig = builtins.readFile ./hyprlock.conf;
  };
  wayland.windowManager.sway.extraConfig = lib.mkIf config.wayland.windowManager.sway.enable (
    lib.mkAfter "bindsym $mod+shift+escape exec hyprlock"
  );
}
