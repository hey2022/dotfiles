{pkgs, ...}: {
  home.packages = with pkgs; [
    qtscrcpy
  ];
}
