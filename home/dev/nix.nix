{pkgs, ...}: {
  home.packages = with pkgs; [
    alejandra
    nh
    nix-init
    nix-search-cli
    nixd
    nixfmt-rfc-style
    nurl
  ];
  programs.nix-index-database.comma.enable = true;
  home.sessionVariables = {
    FLAKE = "$HOME/.dotfiles";
  };
}
