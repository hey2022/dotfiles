{pkgs, ...}: {
  home.packages = with pkgs; [nodePackages.prettier];
}
