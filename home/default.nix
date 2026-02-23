{
  config,
  lib,
  ...
}:
{
  imports = [
    ../lib/hm.nix
    ../modules/home-manager/default.nix
    ./auto-upgrade.nix
    ./dev
    ./font
    ./nix.nix
    ./non-nixos.nix
    ./profiles
    ./programs
    ./services
    ./shell
    ./sops-nix.nix
  ];
  options = {
    home.dotfiles = lib.mkOption {
      type = lib.types.path;
      apply = toString;
      default = "${config.home.homeDirectory}/.dotfiles";
      description = "Location of the dotfiles";
    };
    host.isNixOS = lib.mkOption {
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
    programs.home-manager.enable = true;
  };
}
