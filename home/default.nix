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
  nixpkgs.config.allowUnfree = true;
  nix = {
    package = pkgs.nix;
    settings.experimental-features = [
      "nix-command"
      "flakes"
    ];
  };
}
