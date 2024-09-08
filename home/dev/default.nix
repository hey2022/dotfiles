{ config, pkgs, ... }:

{
  imports = [ ./emacs.nix ];
  home.packages = with pkgs; [
    python311Packages.grip
    bun
    nixfmt-rfc-style
    git
    wget
    neovim
  ];
}
