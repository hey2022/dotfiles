{
  config,
  pkgs,
  ...
}: let
  emacs = pkgs.emacs-pgtk;
in {
  imports = [
    ../tex.nix
    ../../spell
  ];
  home.packages = with pkgs; [
    git
    ripgrep
    fd

    # copilot-node-server
    nodejs

    alsa-utils
    languagetool
  ];
  programs.emacs = {
    enable = true;
    package = emacs;
    extraPackages = epkgs:
      with epkgs; [
        vterm
        jinx
      ];
  };
  services.emacs = {
    enable = true;
    package = emacs;
    client = {
      enable = true;
    };
    startWithUserSession = true;
  };
  xdg.configFile."doom" = {
    source = config.lib.hm.mkFlakeSymlink ./doom;
    recursive = true;
  };
}
