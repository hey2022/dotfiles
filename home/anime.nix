{pkgs, ...}: {
  home.packages = with pkgs; [
    trackma
  ];
}
