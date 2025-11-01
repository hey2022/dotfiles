{
  inputs,
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.programs.emacs;
  emacs = pkgs.emacs-pgtk;
in
{
  imports = [
    ../tex.nix
    ../../spell
  ];
  config = lib.mkIf cfg.enable {
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
      package = emacs;
      extraPackages =
        epkgs: with epkgs; [
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
    xdg.configFile = {
      "doom" = {
        source = config.lib.hm.mkFlakeSymlink ./doom;
        recursive = true;
      };
      "emacs/.local/alarm.wav".source = "${inputs.self}/assets/sounds/alarm.wav";
    };
  };
}
