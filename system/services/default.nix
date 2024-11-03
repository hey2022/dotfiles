{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./ssh.nix
    ./tailscale.nix
  ];
}
