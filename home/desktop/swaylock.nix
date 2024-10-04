{
  config,
  lib,
  pkgs,
  ...
}:

{
  programs.swaylock = {
    enable = true;
    package = if builtins.pathExists "/etc/NIXOS" then pkgs.swaylock-effects else pkgs.emptyDirectory;
    settings = {
      screenshots = true;
      clock = true;
      indicator = true;
      show-failed-attempts = true;
      indicator-radius = 100;
      indicator-thickness = 7;
      effect-blur = "7x5";
      effect-vignette = "0.5:0.5";
      ring-color = "283457";
      key-hl-color = "c0caf5";
      color = "1a1b26";
      text-color = "c0caf5";
    };
  };
}
