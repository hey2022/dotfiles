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
    ../../home/programs/cli
    ../../home/programs/browsers/brave.nix
    ../../home/programs/wechat.nix
    ../../home/profiles/education.nix
  ];

  home.username = "yiheng";
  home.homeDirectory = "/home/yiheng";

  # Let Home Manager install and manage itself.
  home.packages = with pkgs; [
    # Research
    zotero

    # CLI
    trackma

    # Apps
    firefox
    keepassxc
    feishin
    mullvad-vpn
  ];
}
