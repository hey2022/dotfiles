{ inputs, config, ... }:

{
  imports = [
    inputs.determinate.nixosModules.default
    ../common/nix.nix
  ];
  nix = {
    channel.enable = false;
    nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];
    settings = {
      lazy-trees = true;
      eval-cores = 0;
      download-buffer-size = 1073741824;
      keep-going = true;
      show-trace = true;
      substituters = [
        "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store?priority=20"
        "https://mirrors.ustc.edu.cn/nix-channels/store?priority=20"
        "https://nix-community.cachix.org"
        "https://cache.nixos.org?priority=100"
      ];
      trusted-public-keys = [
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      ];
    };
    optimise.automatic = true;
    extraOptions = ''
      !include ${config.sops.secrets.nix-access-tokens.path}
    '';
  };
}
