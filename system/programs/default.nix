{ pkgs, pkgs-local, ... }:
{
  imports = [
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
