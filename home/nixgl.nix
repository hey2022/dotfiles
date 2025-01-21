{
  config,
  lib,
  inputs,
  ...
}: {
  nixGL.packages = lib.mkIf (!config.home.isNixOS) inputs.nixGL.packages;
}
