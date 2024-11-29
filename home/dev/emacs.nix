{
  pkgs,
  inputs,
  ...
}: let
  emacs = pkgs.emacs-unstable-pgtk;
in {
  imports = [./tex.nix];
  nixpkgs.overlays = [(import inputs.emacs-overlay)];
  home.packages = with pkgs; [
    git
    ripgrep
    fd
  ];
  programs.emacs = {
    enable = true;
    package = emacs;
    extraPackages = epkgs: [epkgs.vterm];
  };
  services.emacs = {
    enable = true;
    package = emacs;
    startWithUserSession = true;
  };
  home.file = {
    ".config/doom" = {
      source = ../../.config/doom;
      recursive = true;
    };
  };
}
