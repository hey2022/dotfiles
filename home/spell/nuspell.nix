{pkgs, ...}: {
  imports = [./hunspell.nix];
  home.packages = with pkgs; [
    nuspell
  ];
}
