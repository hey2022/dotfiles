{
  inputs,
  config,
  pkgs,
  ...
}:

{
  imports = [
    inputs.nur.modules.homeManager.default
    inputs.nix-index-database.homeModules.nix-index
    ../common/nix.nix
  ];
  sops.secrets.nix-access-tokens = {
    sopsFile = "${inputs.self}/secrets/nix-access-tokens";
    format = "binary";
  };
  _module.args.pkgs-stable = import inputs.nixpkgs-stable {
    inherit (pkgs.stdenv.hostPlatform) system;
    inherit (config.nixpkgs) config;
  };
  nixpkgs.config.allowUnfree = true;
  nix = {
    package = pkgs.nix;
    extraOptions = ''
      !include ${config.sops.secrets.nix-access-tokens.path}
    '';
  };
}
