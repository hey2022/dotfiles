{ pkgs, ... }:
{
  imports = [
    ./localsend.nix
    ./productivity
  ];
  environment.systemPackages = with pkgs; [
    fastfetch
    fclones
    git
    home-manager
    neovim
    wget
  ];
}
