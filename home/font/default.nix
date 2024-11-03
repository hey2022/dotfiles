{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./font-awesome.nix
    ./local-fonts.nix
  ];
}
