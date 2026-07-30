{ lib, ... }:
{
  imports = [
    ./automount.nix
    ./fail2ban.nix
    ./iperf.nix
    ./mapping.nix
    ./minecraft.nix
    ./pipewire.nix
    ./printing.nix
    ./prometheus
    ./searx.nix
    ./ssh.nix
    ./syncthing.nix
    ./tailscale.nix
  ];
}
