{
  config,
  pkgs,
  inputs,
  ...
}: let
  emacs = pkgs.emacs-unstable-pgtk;
in {
  imports = [./tex.nix ../spell];
  nixpkgs.overlays = [(import inputs.emacs-overlay)];
  home.packages = with pkgs; [
    git
    ripgrep
    fd

    # copilot-node-server
    nodejs_18
  ];
  programs.emacs = {
    enable = true;
    package = emacs;
    extraPackages = epkgs: with epkgs; [vterm jinx];
  };
  services.emacs = {
    enable = true;
    package = emacs;
    startWithUserSession = true;
  };
  home.file = {
    ".config/doom" = {
      source = config.lib.file.mkOutOfStoreSymlink "${config.home.dotfiles}/.config/doom";
      recursive = true;
    };
  };
}
