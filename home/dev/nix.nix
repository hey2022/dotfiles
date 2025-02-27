{pkgs, ...}: {
  home.packages = with pkgs; [
    nh
    nix-search-cli
    nixd
    nurl
    alejandra
    nixfmt-rfc-style
  ];
  programs.nix-index-database.comma.enable = true;
  home.sessionVariables = {
    FLAKE = "$HOME/.dotfiles";
  };
}
