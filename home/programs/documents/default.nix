{pkgs, ...}: {
  imports = [./pdf.nix];
  home.packages = with pkgs; [okular];
}
