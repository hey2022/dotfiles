{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./services
    ./nixgl.nix
    ./xdg
  ];
  options = {
    home.dotfiles = lib.mkOption {
      type = lib.types.path;
      apply = toString;
      default = "${config.home.homeDirectory}/.dotfiles";
      description = "Location of the dotfiles";
    };
  };
  config = {
    home.stateVersion = "24.11";
    programs.home-manager.enable = true;
    nixpkgs.config.allowUnfree = true;
    nix = {
      package = pkgs.nix;
      settings.experimental-features = [
        "nix-command"
        "flakes"
      ];
    };
  };
}
