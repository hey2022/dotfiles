{
  config,
  lib,
  pkgs,
  ...
}:

{
  imports = [ ./nixgl.nix ];
  home.stateVersion = "24.05";
  programs.home-manager.enable = true;
}
