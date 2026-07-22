{ pkgs, pkgs-local, ... }:
{
  imports = [
    ./beets.nix
    ./localsend.nix
    ./productivity
    ./steam.nix
  ];
  environment.systemPackages = with pkgs; [
    fastfetch
    fclones
    git
    home-manager
    neovim
    pkgs-local.keepassxc-snapshot
    wget
  ];
}
