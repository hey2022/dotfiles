{...}: {
  nix = {
    settings = {
      keep-going = true;
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      substituters = [
        "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store?priority=20"
        "https://mirrors.ustc.edu.cn/nix-channels/store?priority=20"
        "https://mirrors.sjtug.sjtu.edu.cn/nix-channels/store"
        "https://nix-community.cachix.org"
        "https://cache.nixos.org?priority=100"
      ];
      trusted-public-keys = [
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      ];
    };
    optimise.automatic = true;
    gc = {
      automatic = true;
      options = "--delete-older-than 7d";
    };
  };
  nixpkgs.config.allowUnfree = true;
}
