{
  inputs,
  config,
  lib,
  pkgs,
  ...
}:
let
  fjordPackages = inputs.fjordlauncher.packages.${pkgs.system};
in
{
  options.programs.fjord = {
    enable = lib.mkEnableOption "Enable fjord";
  };

  config = lib.mkIf (config.profiles.gaming.enable && config.programs.fjord.enable) {
    home.packages = [
      (fjordPackages.fjordlauncher.override {
        fjordlauncher-unwrapped = fjordPackages.fjordlauncher-unwrapped.overrideAttrs (oldAttrs: {
          patches = (oldAttrs.patches or [ ]) ++ [ ./prism-crack.patch ];
        });
      })
    ];
  };
}
