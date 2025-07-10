{
  config,
  lib,
  pkgs,
  ...
}:

{
  imports = [
    ./dnscrypt.nix
  ];
  services.resolved = {
    enable = true;
  };
}
