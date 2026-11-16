{
  inputs,
  pkgs,
  config,
  lib,
  ...
}:

let
  cfg = config.services.hyprpolkitagent;
in
{
  config = lib.mkIf cfg.enable {
    xdg.configFile."hyprpolkitagent/hyprpolkitagent.conf".source = ./hyprpolkitagent.conf;
    services.hyprpolkitagent = {
      # HACK: until https://github.com/hyprwm/hyprpolkitagent/pull/73 is released
      package = inputs.hyprpolkitagent.packages.${pkgs.stdenv.hostPlatform.system}.default;
    };
  };
}
