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
    ../../home/programs/cli
    ../../home/programs/wechat.nix
    ../../home/programs/browsers/brave.nix
    ../../home/profiles/education.nix
    ../../home/profiles/gaming.nix
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
