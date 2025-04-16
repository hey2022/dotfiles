{
  config,
  pkgs,
  inputs,
  ...
}: let
  emacs = pkgs.emacs-unstable-pgtk;
in {
  imports = [
    ../tex.nix
    ../../spell
  ];
  nixpkgs.overlays = [(import inputs.emacs-overlay)];
  home.packages = with pkgs; [
    git
    ripgrep
    fd

    # copilot-node-server
    nodejs_18

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
    startWithUserSession = true;
  };
  xdg.configFile."doom" = {
    source = config.lib.hm.mkFlakeSymlink ./doom;
    recursive = true;
  };
}
