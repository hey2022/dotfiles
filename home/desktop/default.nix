{pkgs, ...}: {
  imports = [./icons.nix ../../modules/stylix.nix];
  home.packages = with pkgs; [
    desktop-file-utils
  ];
}
