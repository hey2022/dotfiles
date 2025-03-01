{pkgs, ...}: {
  imports = [./icons.nix ./stylix.nix ./wluma.nix ./copyq.nix ./imv.nix ../font];
  home.packages = with pkgs; [
    desktop-file-utils
  ];
}
