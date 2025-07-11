{
  config,
  lib,
  pkgs,
  ...
}:

{
  imports = [
    ./copyq.nix
    ./cliphist.nix
  ];
}
