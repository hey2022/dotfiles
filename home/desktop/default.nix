{pkgs, ...}: {
  imports = [./icons.nix];
  home.packages = with pkgs; [
    desktop-file-utils
  ];
}
