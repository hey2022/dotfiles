{ config, pkgs, ... }:

{
  programs.hyprlock = {
    package = if config.host.isNixOS then pkgs.hyprlock else pkgs.emptyDirectory;
    extraConfig = builtins.readFile ./hyprlock.conf;
  };
}
