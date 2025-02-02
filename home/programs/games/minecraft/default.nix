{pkgs, ...}: {
  imports = [./fjord.nix];
  home.packages = with pkgs; [
    cubiomes-viewer
  ];
}
