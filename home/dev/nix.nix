{
  inputs,
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    alejandra
    inputs.nix-alien.packages.${system}.nix-alien
    nh
    nix-init
    nix-search-cli
    nix-tree
    nix-update
    nixd
    nixfmt-rfc-style
    nixpkgs-review
    nurl
    steam-run-free
  ];
  programs.nix-index-database.comma.enable = true;
  home.sessionVariables = {
    NH_FLAKE = config.home.dotfiles;
  };
}
