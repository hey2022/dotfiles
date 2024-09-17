{ config, pkgs, ... }:

{
  imports = [
    ./emacs.nix
    ./git.nix
    ./gpg.nix
  ];
  home.packages = with pkgs; [
    python311Packages.grip
    bun
    nixfmt-rfc-style
    wget
    neovim
  ];
}
