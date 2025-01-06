{pkgs, ...}: {
  home.packages = with pkgs; [
    pcmanfm

    lxmenu-data
    shared-mime-info
  ];
}
