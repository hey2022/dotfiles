{
  config,
  lib,
  inputs,
  ...
}:
{
  nixGL.packages = lib.mkIf (!config.host.isNixOS) inputs.nixGL.packages;
}
