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
      substituters = [
        "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store?priority=20"
        "https://mirrors.ustc.edu.cn/nix-channels/store?priority=20"
        "https://cache.nixos.org?priority=40"
        "https://nix-community.cachix.org?priority=60"
        "https://hyprland.cachix.org?priority=80"
        "https://cache.hey2022.dev?priority=100"
      ];
      trusted-public-keys = [
        "cache.hey2022.dev:jjEoh4E8SFmnwrDvEPQRF3aTj/Y4iNzWj6PkdlBAyGY="
        "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      ];
    };
    optimise.automatic = true;
    extraOptions = ''
      !include ${config.sops.secrets.nix-access-tokens.path}
    '';
  };
}
