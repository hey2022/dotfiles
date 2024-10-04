{
  config,
  pkgs,
  ...
}:

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

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "24.05";

  nixGL.enable = true;
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  home.packages = with pkgs; [
    # Research
    zotero
    biber

    # CLI
    trackma
    hyperfine

    # Apps
    firefox
    keepassxc
    feishin
    mullvad-vpn
  ];
}
