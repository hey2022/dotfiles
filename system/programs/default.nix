{pkgs, ...}: {
  imports = [./productivity];
  environment.systemPackages = with pkgs; [
    home-manager
    fastfetch
    git
    neovim
    wget
  ];
}
