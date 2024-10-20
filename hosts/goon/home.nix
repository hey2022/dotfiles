{ config, pkgs, ... }:

{
  imports = [
    ../../home
    ../../home/desktop/sway
    ../../home/shell/zsh
    ../../home/shell/nushell
    ../../home/dev
    ../../home/services
  ];

  home.username = "yiheng";
  home.homeDirectory = "/home/yiheng";

  # Let Home Manager install and manage itself.
  home.packages = with pkgs; [
    # Research
    zotero
    biber

    # CLI
    trackma

    # Apps
    firefox
    keepassxc
    feishin
    mullvad-vpn
  ];
}
