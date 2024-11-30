{pkgs, ...}: {
  home.packages = with pkgs; [
    doggo
  ];
}
