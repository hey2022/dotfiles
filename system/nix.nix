{ inputs, config, ... }:

{
  imports = [
    inputs.chaotic.nixosModules.default
    inputs.determinate.nixosModules.default
    inputs.nur.modules.nixos.default
    ../common/nix.nix
  ];
  nix = {
    channel.enable = false;
    nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];
    settings = {
      eval-cores = 0;
      download-buffer-size = 1073741824;
      keep-going = true;
      show-trace = true;
    };
    optimise.automatic = true;
    extraOptions = ''
      !include ${config.sops.secrets.nix-access-tokens.path}
    '';
  };
}
