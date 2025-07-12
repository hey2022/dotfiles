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
    inputs.nix-alien.packages.${system}.nix-alien
    nh
    nix-init
    nix-melt
    nix-search-cli
    nix-tree
    nix-update
    nixd
    nixfmt-rfc-style
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
