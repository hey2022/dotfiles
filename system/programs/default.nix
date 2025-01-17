{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    home-manager
    fastfetch
    git
    neovim
    wget
  ];
}
