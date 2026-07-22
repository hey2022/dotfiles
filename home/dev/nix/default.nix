{
  inputs,
  config,
  pkgs,
  ...
}:
{
  imports = [
    ./nix-init.nix
  ];
  nixpkgs.overlays = [
    inputs.nix-alien.overlays.default
  ];
  home.packages = with pkgs; [
    deadnix
    flake-checker
    hydra-check
    nh
    nix-alien
    nix-eval-jobs
    nix-fast-build
    nix-melt
    nix-search-tv
    nix-tree
    nix-update
    nixd
    nixfmt
    nixpkgs-hammering
    nixpkgs-review
    nurl
    statix
    steam-run-free
  ];
  programs.nix-index-database.comma.enable = true;
  home.sessionVariables = {
    NH_FLAKE = config.home.dotfiles;
  };
}
