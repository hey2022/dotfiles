{...}: {
  imports = [
    ./automount.nix
    ./homepage
    ./iperf.nix
    ./kanata.nix
    ./minecraft.nix
    ./pipewire.nix
    ./prometheus
    ./ssh.nix
    ./syncthing.nix
    ./tailscale.nix
  ];
}
