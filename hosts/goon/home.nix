{
  config,
  pkgs,
  ...
}: {
  imports = [
    ../../home
    ../../home/desktop
    ../../home/desktop/sway
    ../../home/shell/zsh
    ../../home/shell/nushell
    ../../home/dev
    ../../home/services
    ../../home/programs/email.nix
    ../../home/programs/browsers/brave.nix
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
