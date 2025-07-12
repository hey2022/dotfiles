{ ... }:
{
  imports = [
    ./ai
    ./automount.nix
    ./fail2ban.nix
    ./iperf.nix
    ./kanata.nix
    ./minecraft.nix
    ./pipewire.nix
    ./printing.nix
    ./prometheus
    ./ssh.nix
    ./syncthing.nix
    ./tailscale.nix
  ];
}
