{pkgs, ...}: {
  imports = [./aspell.nix ./nuspell.nix];
  home.packages = with pkgs; [
    enchant
  ];
}
