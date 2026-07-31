{
  inputs,
  config,
  lib,
  ...
}:
{
  imports = [
    (inputs.import-tree ../modules/home-manager)
    (inputs.import-tree ./profiles)
    (inputs.import-tree ./programs)
    (inputs.import-tree ./services)
    (inputs.import-tree ./shell)
    ../lib/hm.nix
    ./auto-upgrade.nix
    ./dev
    ./fonts.nix
    ./nix.nix
    ./non-nixos.nix
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
