{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    alejandra
    nh
    nix-init
    nix-search-cli
    nix-tree
    nixd
    nixfmt-rfc-style
    nurl
  ];
  programs.nix-index-database.comma.enable = true;
  home.sessionVariables = {
    FLAKE = config.home.dotfiles;
  };
}
