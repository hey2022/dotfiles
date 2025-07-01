{
  config,
  pkgs,
  ...
}:
{
  programs.swaylock = {
    enable = true;
    package = if config.home.isNixOS then pkgs.swaylock-effects else pkgs.emptyDirectory;
    settings = {
      screenshots = true;
      clock = true;
      indicator = true;
      show-failed-attempts = true;
      indicator-radius = 100;
      indicator-thickness = 7;
      effect-blur = "7x5";
      effect-vignette = "0.5:0.5";
    };
  };
}
