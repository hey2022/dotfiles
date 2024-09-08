{ config, pkgs, ... }:

{
  imports = [ ../../home/desktop/sway.nix ];
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

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  home.packages = with pkgs; [
    # Shell
    eza
    ripgrep
    fd
    bat

    # Development
    python311Packages.grip
    bun
    nixfmt-rfc-style
    git
    wget
    neovim
    emacs

    # Research
    zotero
    biber

    # CLI
    trackma
    fastfetch
    hyperfine

    # Apps
    firefox
    keepassxc
    feishin
    mullvad-vpn
  ];

  home.file = {
    ".config" = {
      source = ../../.config;
      recursive = true;
    };
    ".local/share/fonts" = {
      source = ../../.local/share/fonts;
      recursive = true;
    };
    ".zshenv".source = ../../.zshenv;
  };
}
