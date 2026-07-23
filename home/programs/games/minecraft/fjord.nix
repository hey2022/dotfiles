{
  inputs,
  config,
  lib,
  pkgs,
  ...
}:
let
  fjordPackages = inputs.fjordlauncher.packages.${pkgs.stdenv.hostPlatform.system};
in
{
  config = lib.mkIf (config.profiles.gaming.enable && config.profiles.gaming.minecraft.enable) {
    home.packages = [
      (fjordPackages.fjordlauncher.override {
        fjordlauncher-unwrapped = fjordPackages.fjordlauncher-unwrapped.overrideAttrs (oldAttrs: {
          patches = (oldAttrs.patches or [ ]) ++ [ ./prism-crack.patch ];
        });
      })
    ];
  };
}
