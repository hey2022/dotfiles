{
  lib,
  inputs,
  ...
}: {
  nixGL.packages = lib.mkIf (!builtins.pathExists "/etc/NIXOS") inputs.nixGL.packages;
}
