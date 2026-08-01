{ pkgs, pkgs-local, ... }:
{
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
