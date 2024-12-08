{
  config,
  pkgs,
  ...
}: {
  imports = [
    ../../home
    ../../home/desktop
    ../../home/desktop/sway
    ../../home/dev
    ../../home/shell/nushell
    ../../home/programs/email.nix
    ../../home/programs/cli
    ../../home/programs/documents
    ../../home/programs/wechat.nix
    ../../home/programs/inkscape.nix
    ../../home/programs/browsers/brave.nix
  ];
  home.username = "yiheng";
  home.homeDirectory = "/home/yiheng";

  home.packages = with pkgs; [
    # Research
    zotero

    # CLI
    trackma

    # Apps
    firefox
    keepassxc
    feishin
  ];
}
