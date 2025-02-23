{pkgs, ...}: {
  imports = [./icons.nix ./stylix.nix ./wluma.nix ./copyq.nix ./imv.nix];
  home.packages = with pkgs; [
    desktop-file-utils
  ];
}
