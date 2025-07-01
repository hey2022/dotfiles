{
  inputs,
  config,
  lib,
  pkgs,
  ...
}:
{
  imports = [
    ../lib/hm.nix
    ./font
    ./nixgl.nix
    ./profiles
    ./programs
    ./services
    ./shell
  ];
  options = {
    home.dotfiles = lib.mkOption {
      type = lib.types.path;
      apply = toString;
      default = "${config.home.homeDirectory}/.dotfiles";
      description = "Location of the dotfiles";
    };
    home.isNixOS = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Whether the system is running NixOS";
    };
    host.laptop = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Whether the host is a laptop";
    };
  };
  config = {
    _module.args.pkgs-stable = import inputs.nixpkgs-stable {
      inherit (pkgs.stdenv.hostPlatform) system;
      inherit (config.nixpkgs) config;
    };
    home.stateVersion = "25.05";
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
