{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.virtualisation.waydroid;
in
{
  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      wl-clipboard
      nur.repos.ataraxiasjel.waydroid-script
    ];
  };
}
