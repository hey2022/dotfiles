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
    steam-run-free
    nix-tree
    nix-update
    nixd
    nixfmt-rfc-style
    nurl
  ];
  programs.nix-index-database.comma.enable = true;
  home.sessionVariables = {
    NH_FLAKE = config.home.dotfiles;
  };
}
