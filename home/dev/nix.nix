{
  inputs,
  config,
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    deadnix
    flake-checker
    hydra-check
    inputs.nix-alien.packages.${system}.nix-alien
    nh
    nix-init
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
