{...}: {
  imports = [
    ./network
    ./bluetooth.nix
    ./nix-ld.nix
  ];
  system.stateVersion = "23.05";
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  nixpkgs.config.allowUnfree = true;
}
