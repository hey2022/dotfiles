{pkgs, ...}: {
  home.packages = with pkgs; [
    nh
    nix-search-cli
    nixd
    alejandra
  ];
  programs.nix-index-database.comma.enable = true;
  home.sessionVariables = {
    FLAKE = "$HOME/.dotfiles";
  };
}
