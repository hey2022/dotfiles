{pkgs, ...}: {
  imports = [
    ./localsend.nix
    ./productivity
  ];
  environment.systemPackages = with pkgs; [
    home-manager
    fastfetch
    git
    neovim
    wget
  ];
}
